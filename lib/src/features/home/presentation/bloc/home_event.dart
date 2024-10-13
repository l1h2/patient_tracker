part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class AddCompany extends HomeEvent {
  final String name;
  final String userId;

  const AddCompany(this.name, this.userId);

  @override
  List<Object> get props => [name, userId];
}

class GetCompanies extends HomeEvent {
  final String userId;

  const GetCompanies(this.userId);

  @override
  List<Object> get props => [userId];
}

class UpdateCompany extends HomeEvent {
  final String userId;
  final Company company;
  final String name;

  const UpdateCompany({
    required this.userId,
    required this.company,
    required this.name,
  });

  @override
  List<Object> get props => [userId, company, name];
}

class DeleteCompany extends HomeEvent {
  final String userId;
  final Company company;

  const DeleteCompany(this.userId, this.company);

  @override
  List<Object> get props => [userId, company];
}
