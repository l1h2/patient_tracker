import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/records_entity.dart';
import '../../domain/usecases/records_usecase.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'records_event.dart';
part 'records_state.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc(
    this._recordsUseCase,
    this._userRepo,
  ) : super(RecordsInitial()) {
    on<SaveRecords>(_onSaveRecords);
    on<GetRecords>(_onGetRecords);
    on<DeleteRecords>(_onDeleteRecords);
  }

  final RecordsUseCase _recordsUseCase;
  final UserRepository _userRepo;

  late String companyId;
  late String patientId;
  late Records currentRecords;

  void init({
    required String companyId,
    required String patientId,
    required DateTime date,
  }) {
    this.companyId = companyId;
    this.patientId = patientId;
    currentRecords = _userRepo.getRecordsFromDate(companyId, patientId, date) ??
        Records.empty(
          _userRepo.user!,
          _userRepo.getPatient(companyId, patientId)!,
          date,
        );
  }

  Company get company => _userRepo.getCompany(companyId)!;
  Patient? get patient => _userRepo.getPatient(companyId, patientId);

  void _onSaveRecords(SaveRecords event, Emitter<RecordsState> emit) async {
    emit(RecordsLoading());

    late Records newRecords;
    final Records emptyRecords = Records.empty(
      _userRepo.user!,
      patient!,
      currentRecords.date,
    );

    if (currentRecords.id == null) {
      if (currentRecords.isEqual(emptyRecords, considerDefaults: false)) {
        emit(EmptyRecords());
        return;
      }

      newRecords = currentRecords.copy();
    } else {
      newRecords = _userRepo
          .getRecords(companyId, patientId, currentRecords.id!)!
          .getChanges(currentRecords);

      if (newRecords.isEqual(emptyRecords)) {
        emit(NoChangesToSave());
        return;
      }
    }

    try {
      final String recordsId = await _recordsUseCase(
        RecordsParams(
          userId: _userRepo.userId!,
          companyId: companyId,
          patientId: patientId,
          records: newRecords,
        ),
      );

      currentRecords.id = recordsId;
      await _userRepo.updateRecordsFromRecords(
        companyId,
        patientId,
        currentRecords,
      );

      emit(RecordsSuccess());
    } catch (e) {
      emit(RecordsFailure(e.toString()));
    }
  }

  void _onGetRecords(GetRecords event, Emitter<RecordsState> emit) async {
    emit(SearchingRecords());

    final Records emptyRecords = Records.empty(
      _userRepo.user!,
      patient!,
      event.date,
    );

    if (!patient!.recordDates.contains(event.date)) {
      currentRecords.updateWith(emptyRecords);
      emit(GetRecordsSuccess());
      return;
    }

    final Records? localRecords = _userRepo.getRecordsFromDate(
      companyId,
      patientId,
      event.date,
    );

    if (localRecords != null) {
      currentRecords.updateWith(localRecords);
      emit(GetRecordsSuccess());
      return;
    }

    try {
      final Records? records = await _recordsUseCase.getRecords(
        GetRecordsParams(
          userId: _userRepo.userId!,
          companyId: companyId,
          patientId: patientId,
          date: event.date,
        ),
      );

      if (records == null) {
        emit(const GetRecordsFailure('No records found'));
        return;
      }

      await _userRepo.addRecords(companyId, patientId, records);
      currentRecords.updateWith(records);
      emit(GetRecordsSuccess());
    } catch (e) {
      emit(GetRecordsFailure(e.toString()));
    }
  }

  void _onDeleteRecords(
    DeleteRecords event,
    Emitter<RecordsState> emit,
  ) async {
    emit(RecordsLoading());

    try {
      await _recordsUseCase.deleteRecords(
        DeleteRecordsParams(
          userId: _userRepo.userId!,
          companyId: companyId,
          patientId: patientId,
          recordsId: currentRecords.id!,
          date: currentRecords.date,
        ),
      );

      await _userRepo.removeRecords(
        companyId,
        patientId,
        currentRecords,
      );

      currentRecords.updateWith(
        Records.empty(
          _userRepo.user!,
          patient!,
          currentRecords.date,
        ),
      );

      emit(DeleteRecordsSuccess());
    } catch (e) {
      emit(RecordsFailure(e.toString()));
    }
  }
}
