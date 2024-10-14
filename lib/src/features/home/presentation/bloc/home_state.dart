part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class FoundCompanies extends HomeState {}

final class SearchingCompanies extends HomeState {}

final class AddCompanySuccess extends HomeState {}

final class UpdateCompanySuccess extends HomeState {}

final class DeleteCompanySuccess extends HomeState {}

final class AddCompanyFailure extends HomeState {
  final String error;

  const AddCompanyFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class HomeFailure extends HomeState {
  final String error;

  const HomeFailure(this.error);

  @override
  List<Object> get props => [error];
}
