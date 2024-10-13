import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/records_entity.dart';
import '../../domain/usecases/records_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/models/user_model.dart';
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

    late Records newRecords;
    final Records emptyRecords = Records.empty(
      event.user,
      event.patient,
      event.records.date,
    );

    if (event.records.id == null) {
      if (event.records.isEqual(emptyRecords, considerDefaults: false)) {
        emit(EmptyRecords());
        return;
      }

      newRecords = event.records;
    } else {
      newRecords = _userRepository
          .getRecords(
            event.company,
            event.patient,
            event.records.id!,
          )!
          .getChanges(event.records);

      if (newRecords.isEqual(emptyRecords)) {
        emit(NoChangesToSave());
        return;
      }
    }

    try {
      final String recordsId = await _recordsUseCase(
        RecordsParams(
          userId: event.user.id,
          companyId: event.company.id,
          patientId: event.patient.id,
          records: newRecords,
        ),
      );

      event.records.id = recordsId;
      _userRepository.updateRecords(
        event.company,
        event.patient,
        event.records.copy(),
      );

      emit(RecordsSuccess());
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
      emit(GetRecordsSuccess(localRecords.copy()));
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
      emit(GetRecordsSuccess(records.copy()));
    } catch (e) {
      emit(GetRecordsFailure(e.toString()));
    }
  }
}
