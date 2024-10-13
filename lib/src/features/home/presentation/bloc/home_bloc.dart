import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/usecases/home_usecase.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._homeUseCase) : super(HomeInitial()) {
    on<AddCompany>(_onAddCompany);
    on<GetCompanies>(_onGetCompanies);
    on<UpdateCompany>(_onUpdateCompany);
    on<DeleteCompany>(_onDeleteCompany);
  }

  final HomeUseCase _homeUseCase;

  final UserRepository _userRepository = locator<UserRepository>();

  void _onAddCompany(AddCompany event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      await _homeUseCase(HomeParams(name: event.name, userId: event.userId));
      emit(AddCompanySuccess());
    } catch (e) {
      emit(AddCompanyFailure(e.toString()));
    }
  }

  void _onGetCompanies(
    GetCompanies event,
    Emitter<HomeState> emit,
  ) async {
    emit(SearchingCompanies());
    try {
      final List<Company> companies = await _homeUseCase.getCompanies(
        event.userId,
      );
      _userRepository.updateCompanies(companies);
      emit(FoundCompanies(_userRepository.getCompanies()));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  void _onUpdateCompany(UpdateCompany event, Emitter<HomeState> emit) async {
    emit(SearchingCompanies());
    try {
      final Company company = await _homeUseCase.updateCompany(
        event.userId,
        event.company,
        event.name,
      );
      _userRepository.updateCompany(company);
      emit(FoundCompanies(_userRepository.getCompanies()));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  void _onDeleteCompany(DeleteCompany event, Emitter<HomeState> emit) async {
    emit(SearchingCompanies());
    try {
      await _homeUseCase.deleteCompany(event.userId, event.company.id);
      _userRepository.removeCompany(event.company);
      emit(FoundCompanies(_userRepository.getCompanies()));
      emit(DeleteCompanySuccess());
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
