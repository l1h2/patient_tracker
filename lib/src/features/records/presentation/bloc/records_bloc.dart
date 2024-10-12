import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:patient_tracker/src/core/models/user_model.dart';

import '../../domain/entities/records_entity.dart';
import '../../domain/usecases/records_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'records_event.dart';
part 'records_state.dart';

class RecordsBloc extends Bloc<RecordsEvent, RecordsState> {
  RecordsBloc(this._recordsUseCase) : super(RecordsInitial()) {
    on<SaveRecords>(_onSaveRecords);
    on<GetRecords>(_onGetRecords);
  }

  final RecordsUseCase _recordsUseCase;
  final UserRepository _userRepository = locator<UserRepository>();

  void _onSaveRecords(SaveRecords event, Emitter<RecordsState> emit) async {
    emit(RecordsLoading());

    if (event.records.id == null) {
      await _addRecords(event, emit);
      return;
    }

    final Records newRecords = event.records.getChanges(
      _userRepository.getRecords(
        event.company,
        event.patient,
        event.records.id!,
      )!,
    );

    if (newRecords.isEqual(
      Records.empty(
        event.user,
        event.patient,
        event.records.date,
      ),
    )) {
      emit(NoChangesToSave());
      return;
    }

    try {
      await _recordsUseCase(
        RecordsParams(
          userId: event.user.id,
          companyId: event.company.id,
          patientId: event.patient.id,
          records: newRecords,
        ),
      );

      _userRepository.updateRecords(
        event.company,
        event.patient,
        event.records,
      );
      emit(RecordsSuccess(event.records));
    } catch (e) {
      emit(RecordsFailure(e.toString()));
    }
  }

  void _onGetRecords(GetRecords event, Emitter<RecordsState> emit) async {
    emit(SearchingRecords());

    final Records emptyRecords = Records.empty(
      event.user,
      event.patient,
      event.date,
    );

    if (!event.patient.recordDates.contains(event.date)) {
      emit(GetRecordsSuccess(emptyRecords));
      return;
    }

    final Patient patient = _userRepository.getPatient(
      event.company,
      event.patient.id,
    )!;

    final Records localRecords = patient.records.values.firstWhere(
      (record) => record.date == event.date,
      orElse: () => emptyRecords,
    );

    if (!localRecords.isEqual(emptyRecords)) {
      emit(GetRecordsSuccess(localRecords));
      return;
    }

    try {
      final Records? records = await _recordsUseCase.getRecords(
        GetRecordsParams(
          userId: event.user.id,
          companyId: event.company.id,
          patientId: event.patient.id,
          date: event.date,
        ),
      );

      if (records == null) {
        emit(const GetRecordsFailure('No records found'));
        return;
      }

      _userRepository.updateRecords(event.company, event.patient, records);
      emit(GetRecordsSuccess(records));
    } catch (e) {
      emit(GetRecordsFailure(e.toString()));
    }
  }

  Future<void> _addRecords(
    SaveRecords event,
    Emitter<RecordsState> emit,
  ) async {
    if (event.records.isEqual(
      Records.empty(
        event.user,
        event.patient,
        event.records.date,
      ),
    )) {
      emit(EmptyRecords());
      return;
    }

    try {
      final Records records = await _recordsUseCase(
        RecordsParams(
          userId: event.user.id,
          companyId: event.company.id,
          patientId: event.patient.id,
          records: event.records,
        ),
      );
      _userRepository.updateRecords(event.company, event.patient, records);
      emit(RecordsSuccess(records));
    } catch (e) {
      emit(RecordsFailure(e.toString()));
    }
  }
}
