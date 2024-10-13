import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/patients_entity.dart';
import '../../domain/usecases/patients_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc(this._patientsUseCase) : super(PatientsInitial()) {
    on<AddPatient>(_onAddPatient);
    on<GetPatients>(_onGetPatients);
    on<UpdatePatient>(_onUpdatePatient);
    on<GetRecords>(_onGetRecords);
    on<DeletePatient>(_onDeletePatient);
  }

  final PatientsUseCase _patientsUseCase;
  final UserRepository _userRepository = locator<UserRepository>();

  void _onAddPatient(AddPatient event, Emitter<PatientsState> emit) async {
    emit(PatientsLoading());
    try {
      await _patientsUseCase(
        PatientParams(
          name: event.name,
          isMale: event.isMale,
          userId: event.userId,
          companyId: event.companyId,
        ),
      );
      emit(AddPatientSuccess());
    } catch (e) {
      emit(AddPatientFailure(e.toString()));
    }
  }

  void _onGetPatients(GetPatients event, Emitter<PatientsState> emit) async {
    emit(SearchingPatients());
    try {
      final List<Patient> patients = await _patientsUseCase.getPatients(
        event.userId,
        event.company.id,
      );
      _userRepository.updatePatients(event.company, patients);
      emit(FoundPatients(_userRepository.getPatients(event.company)));
    } catch (e) {
      emit(PatientsFailure(e.toString()));
    }
  }

  void _onUpdatePatient(
    UpdatePatient event,
    Emitter<PatientsState> emit,
  ) async {
    emit(SearchingPatients());
    try {
      final Patient patient = await _patientsUseCase.updatePatient(
        UpdatePatientParams(
          userId: event.userId,
          companyId: event.company.id,
          patient: event.patient,
          name: event.name,
          isMale: event.isMale,
        ),
      );
      _userRepository.updatePatient(event.company, patient);
      emit(FoundPatients(_userRepository.getPatients(event.company)));
    } catch (e) {
      emit(PatientsFailure(e.toString()));
    }
  }

  void _onGetRecords(GetRecords event, Emitter<PatientsState> emit) async {
    emit(PatientsLoading());
    try {
      final GetRecordsReturn response = await _patientsUseCase.getRecords(
        GetRecordsParams(
          user: event.user,
          company: event.company,
          patient: event.patient,
          date: event.date,
        ),
      );

      final Records records = response.records ??
          Records.empty(
            event.user,
            event.patient,
            event.date,
          );

      _userRepository.updatePatientRecords(
        event.company,
        event.patient,
        records,
        response.recordDates,
      );

      emit(
        GetRecordsSuccess(
          _userRepository.getPatient(event.company, event.patient.id)!,
          records.copy(),
        ),
      );
    } catch (e) {
      emit(PatientsFailure(e.toString()));
    }
  }

  void _onDeletePatient(
    DeletePatient event,
    Emitter<PatientsState> emit,
  ) async {
    emit(SearchingPatients());
    try {
      await _patientsUseCase.deletePatient(
        DeletePatientParams(
          userId: event.userId,
          companyId: event.company.id,
          patientId: event.patient.id,
        ),
      );
      _userRepository.removePatient(event.company, event.patient);
      emit(FoundPatients(_userRepository.getPatients(event.company)));
      emit(DeletePatientSuccess());
    } catch (e) {
      emit(PatientsFailure(e.toString()));
    }
  }
}
