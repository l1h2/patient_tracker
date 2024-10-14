import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/home_entity.dart';
import '../../domain/usecases/home_usecase.dart';

import '/src/core/models/company_model.dart';
import '/src/core/repositories/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._homeUseCase, this._userRepo) : super(HomeInitial()) {
    on<AddCompany>(_onAddCompany);
    on<GetCompanies>(_onGetCompanies);
    on<UpdateCompany>(_onUpdateCompany);
    on<DeleteCompany>(_onDeleteCompany);
  }

  final HomeUseCase _homeUseCase;
  final UserRepository _userRepo;

  List<Company> get companies => _userRepo.getCompanies();

  void _onAddCompany(AddCompany event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final String companyId = await _homeUseCase(
        HomeParams(name: event.name, userId: _userRepo.userId!),
      );

      final Company company = Company(id: companyId, name: event.name);
      await _userRepo.addCompany(company);

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
        _userRepo.userId!,
      );

      await _userRepo.updateCompanies(companies);

      emit(FoundCompanies());
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  void _onUpdateCompany(UpdateCompany event, Emitter<HomeState> emit) async {
    emit(SearchingCompanies());
    try {
      await _homeUseCase.updateCompany(
        _userRepo.userId!,
        event.companyId,
        event.name,
      );
      await _userRepo.updateCompany(event.companyId, event.name);
      emit(UpdateCompanySuccess());
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  void _onDeleteCompany(DeleteCompany event, Emitter<HomeState> emit) async {
    emit(SearchingCompanies());
    try {
      await _homeUseCase.deleteCompany(_userRepo.userId!, event.companyId);
      await _userRepo.removeCompany(event.companyId);
      emit(DeleteCompanySuccess());
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
