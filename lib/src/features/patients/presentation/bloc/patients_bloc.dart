import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/patients_entity.dart';
import '../../domain/usecases/patients_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc(this._patientsUseCase) : super(PatientsInitial()) {
    on<AddPatient>(_onAddPatient);
    on<GetPatients>(_onGetPatients);
  }

  final PatientsUseCase _patientsUseCase;
  final UserRepository _userRepository = locator<UserRepository>();

  void _onAddPatient(AddPatient event, Emitter<PatientsState> emit) async {
    emit(PatientsLoading());
    try {
      await _patientsUseCase(
        PatientParams(
          name: event.name,
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
}
