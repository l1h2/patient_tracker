part of 'patients_bloc.dart';

sealed class PatientsEvent extends Equatable {
  const PatientsEvent();

  @override
  List<Object> get props => [];
}

class AddPatient extends PatientsEvent {
  final String name;
  final String userId;
  final String companyId;

  const AddPatient(this.name, this.userId, this.companyId);

  @override
  List<Object> get props => [name, userId, companyId];
}

class GetPatients extends PatientsEvent {
  final String userId;
  final Company company;

  const GetPatients(this.userId, this.company);

  @override
  List<Object> get props => [userId, company];
}

class GetRecords extends PatientsEvent {
  final User user;
  final Company company;
  final Patient patient;
  final DateTime date;

  const GetRecords({
    required this.user,
    required this.company,
    required this.patient,
    required this.date,
  });

  @override
  List<Object> get props => [user, company, patient, date];
}

class UpdatePatient extends PatientsEvent {
  final String userId;
  final Company company;
  final Patient patient;
  final String name;

  const UpdatePatient({
    required this.userId,
    required this.company,
    required this.patient,
    required this.name,
  });

  @override
  List<Object> get props => [userId, company, patient, name];
}
