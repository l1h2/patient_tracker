import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/patients_bloc.dart';
import '../widgets/action_menu.dart';

import '/config/locator/setup.dart';
import '/config/routes/router.gr.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';
import '/src/core/widgets/entity_list.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';
import '/src/features/home/presentation/bloc/home_bloc.dart';

@RoutePage()
class PatientsScreen extends StatelessWidget {
  PatientsScreen({super.key, required Company company})
      : _patients = locator<UserRepository>().getPatients(company),
        _company = locator<UserRepository>().getCompany(company.id)!;

  final Company _company;
  final List<Patient> _patients;

  final _searchController = TextEditingController();
  final User _user = locator<UserRepository>().getUser()!;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05;
    final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);

    return BlocConsumer<PatientsBloc, PatientsState>(
      listener: (context, state) {
        if (state is FoundPatients) {
          _patients.clear();
          _patients.addAll(state.patients);
        } else if (state is GetRecordsSuccess) {
          router.push(
            RecordsRoute(
              company: _company,
              patient: state.patient,
              currentRecords: state.records,
            ),
          );
        } else if (state is PatientsFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<HomeBloc, HomeState>(
          listener: (context, homeState) {
            if (homeState is DeleteCompanySuccess) {
              router.maybePop();
            }
          },
          builder: (context, homeState) {
            return ModalProgressHUD(
              inAsyncCall: homeState is SearchingCompanies,
              child: ScrollableScaffold(
                appBar: MainAppBar(
                  title: _company.name,
                  actionButton: RecordsActionMenu(
                    locale: locale,
                    user: _user,
                    company: _company,
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => router.push(
                    AddPatientRoute(company: _company),
                  ),
                  child: const Icon(Icons.add),
                ),
                content: Padding(
                  padding: EdgeInsets.fromLTRB(
                    padding,
                    10,
                    padding,
                    padding * 2,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: locale.search,
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (state is SearchingPatients)
                        const CupertinoActivityIndicator(radius: 16)
                      else if (_patients.isEmpty)
                        Column(
                          children: [
                            Text(
                              locale.noPatients,
                              style: theme.textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 42),
                            SizedBox(
                              height: 56,
                              width: screenSize.width * 0.8,
                              child: OutlinedButton(
                                child: Text(locale.refresh),
                                onPressed: () => patientsBloc.add(
                                  GetPatients(_user.id, _company),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (_patients.isNotEmpty)
                        EntityList(
                          items: _patients,
                          searchController: _searchController,
                          getName: (patient) => patient.name,
                          onItemTap: (patient) {
                            DateTime now = DateTime.now();
                            DateTime todayMidnight = DateTime(
                              now.year,
                              now.month,
                              now.day,
                            ).toUtc();
                            patientsBloc.add(
                              GetRecords(
                                user: _user,
                                company: _company,
                                patient: patient,
                                date: todayMidnight,
                              ),
                            );
                          },
                        )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
