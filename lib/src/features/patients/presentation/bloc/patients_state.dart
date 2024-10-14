part of 'patients_bloc.dart';

sealed class PatientsState extends Equatable {
  const PatientsState();

  @override
  List<Object> get props => [];
}

final class PatientsInitial extends PatientsState {}

final class PatientsLoading extends PatientsState {}

final class GettingRecords extends PatientsState {}

final class FoundPatients extends PatientsState {}

final class SearchingPatients extends PatientsState {}

final class AddPatientSuccess extends PatientsState {}

final class UpdatePatientSuccess extends PatientsState {}

final class DeletePatientSuccess extends PatientsState {}

final class GetRecordsSuccess extends PatientsState {
  final String companyId;
  final String patientId;
  final DateTime date;

  const GetRecordsSuccess(this.companyId, this.patientId, this.date);

  @override
  List<Object> get props => [companyId, patientId, date];
}

final class NoChangesToSave extends PatientsState {}

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
