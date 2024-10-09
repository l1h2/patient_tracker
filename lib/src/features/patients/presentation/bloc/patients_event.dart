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

class UpdateCompany extends PatientsEvent {}

class FinishCompanyUpdate extends PatientsEvent {}
