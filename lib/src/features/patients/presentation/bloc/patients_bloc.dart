import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/patients_entity.dart';
import '../../domain/usecases/patients_usecase.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc(
    this._patientsUseCase,
    this._userRepo,
  ) : super(PatientsInitial()) {
    on<AddPatient>(_onAddPatient);
    on<GetPatients>(_onGetPatients);
    on<UpdatePatient>(_onUpdatePatient);
    on<DeletePatient>(_onDeletePatient);
    on<GetRecords>(_onGetRecords);
  }

  final PatientsUseCase _patientsUseCase;
  final UserRepository _userRepo;

  late String companyId;

  void init(String companyId) => this.companyId = companyId;

  Company? get company => _userRepo.getCompany(companyId);
  List<Patient> get patients => _userRepo.getPatients(companyId);

  void _onAddPatient(AddPatient event, Emitter<PatientsState> emit) async {
    emit(PatientsLoading());
    try {
      final String patientId = await _patientsUseCase(
        PatientParams(
          name: event.name,
          isMale: event.isMale,
          userId: _userRepo.userId!,
          companyId: companyId,
        ),
      );

      final Patient patient = Patient(
        id: patientId,
        name: event.name,
        isMale: event.isMale,
      );
      await _userRepo.addPatient(companyId, patient);

      emit(AddPatientSuccess());
    } catch (e) {
      emit(AddPatientFailure(e.toString()));
    }
  }

  void _onGetPatients(GetPatients event, Emitter<PatientsState> emit) async {
    emit(SearchingPatients());
    try {
      final List<Patient> patients = await _patientsUseCase.getPatients(
        _userRepo.userId!,
        companyId,
      );
      await _userRepo.updatePatients(companyId, patients);
      emit(FoundPatients());
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
      await _patientsUseCase.updatePatient(
        UpdatePatientParams(
          userId: _userRepo.userId!,
          companyId: companyId,
          patientId: event.patientId,
          name: event.name,
          isMale: event.isMale,
        ),
      );

      await _userRepo.updatePatient(
        companyId,
        event.patientId,
        event.name,
        event.isMale,
      );

      emit(UpdatePatientSuccess());
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
          userId: _userRepo.userId!,
          companyId: companyId,
          patientId: event.patientId,
        ),
      );
      await _userRepo.removePatient(companyId, event.patientId);
      emit(DeletePatientSuccess());
    } catch (e) {
      emit(PatientsFailure(e.toString()));
    }
  }

  void _onGetRecords(GetRecords event, Emitter<PatientsState> emit) async {
    emit(GettingRecords());

    try {
      final GetRecordsReturn response = await _patientsUseCase.getRecords(
        GetRecordsParams(
          userId: _userRepo.userId!,
          companyId: companyId,
          patientId: event.patientId,
          date: event.date,
        ),
      );

      await _userRepo.updatePatientRecords(
        companyId,
        event.patientId,
        response.records,
        response.recordDates,
      );

      emit(GetRecordsSuccess(
          companyId, event.patientId, event.date, event.pushRecordsRoute));
    } catch (e) {
      emit(PatientsFailure(e.toString()));
    }
  }
}
