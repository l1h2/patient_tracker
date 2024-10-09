part of 'patients_bloc.dart';

sealed class PatientsState extends Equatable {
  const PatientsState();

  @override
  List<Object> get props => [];
}

final class PatientsInitial extends PatientsState {}

final class PatientsLoading extends PatientsState {}

final class FoundPatients extends PatientsState {
  final List<Patient> patients;

  const FoundPatients(this.patients);

  @override
  List<Object> get props => [patients];
}

final class SearchingPatients extends PatientsState {}

final class AddPatientSuccess extends PatientsState {}

final class AddPatientFailure extends PatientsState {
  final String error;

  const AddPatientFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class PatientsFailure extends PatientsState {
  final String error;

  const PatientsFailure(this.error);

  @override
  List<Object> get props => [error];
}
