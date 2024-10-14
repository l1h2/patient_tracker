part of 'patients_bloc.dart';

sealed class PatientsEvent extends Equatable {
  const PatientsEvent();

  @override
  List<Object> get props => [];
}

class AddPatient extends PatientsEvent {
  final String name;
  final bool isMale;

  const AddPatient(this.name, this.isMale);

  @override
  List<Object> get props => [name, isMale];
}

class GetPatients extends PatientsEvent {}

class GetRecords extends PatientsEvent {
  final String patientId;
  final DateTime date;
  final bool pushRecordsRoute;

  const GetRecords({
    required this.patientId,
    required this.date,
    this.pushRecordsRoute = true,
  });

  @override
  List<Object> get props => [patientId, date, pushRecordsRoute];
}

class UpdatePatient extends PatientsEvent {
  final String patientId;
  final String name;
  final bool isMale;

  const UpdatePatient({
    required this.patientId,
    required this.name,
    required this.isMale,
  });

  @override
  List<Object> get props => [patientId, name, isMale];
}

class DeletePatient extends PatientsEvent {
  final String patientId;

  const DeletePatient(this.patientId);

  @override
  List<Object> get props => [patientId];
}
