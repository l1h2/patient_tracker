part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddCompany extends HomeEvent {
  final String name;

  const AddCompany(this.name);

  @override
  List<Object> get props => [name];
}

class GetCompanies extends HomeEvent {}

class UpdateCompany extends HomeEvent {
  final String companyId;
  final String name;

  const UpdateCompany({
    required this.companyId,
    required this.name,
  });

  @override
  List<Object> get props => [companyId, name];
}

class DeleteCompany extends HomeEvent {
  final String companyId;

  const DeleteCompany(this.companyId);

  @override
  List<Object> get props => [companyId];
}
