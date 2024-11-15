import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/patients_bloc.dart';
import '../widgets/action_menu.dart';

import '/config/routes/router.gr.dart';
import '/src/core/widgets/entity_list.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';
import '/src/core/widgets/selection_checkbox.dart';
import '/src/features/home/presentation/bloc/home_bloc.dart';

@RoutePage()
class PatientsScreen extends StatelessWidget {
  PatientsScreen({super.key, required this.companyId});

  final String companyId;

  final _searchController = TextEditingController();
  final _initController = BoolController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05;
    final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);

    if (!_initController.boolean) {
      patientsBloc.init(companyId);
      _initController.boolean = true;
    }

    return BlocConsumer<PatientsBloc, PatientsState>(
      listener: (context, state) {
        if (state is GetRecordsSuccess && state.pushRecordsRoute) {
          router.push(
            RecordsRoute(
              companyId: state.companyId,
              patientId: state.patientId,
              date: state.date,
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
            if (homeState is DeleteCompanySuccess) router.maybePop();
          },
          builder: (context, homeState) {
            return ModalProgressHUD(
              inAsyncCall:
                  homeState is SearchingCompanies || state is GettingRecords,
              child: RefreshIndicator(
                onRefresh: () async => patientsBloc.add(GetPatients()),
                child: ScrollableScaffold(
                  appBar: MainAppBar(
                    title: patientsBloc.company?.name ?? '',
                    actionButton: const RecordsActionMenu(),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () => router.push(AddPatientRoute()),
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
                        else if (patientsBloc.patients.isEmpty)
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
                                    GetPatients(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (patientsBloc.patients.isNotEmpty)
                          EntityList(
                            items: patientsBloc.patients,
                            searchController: _searchController,
                            getName: (patient) => patient.name,
                            onItemTap: (patient) {
                              DateTime now = DateTime.now();
                              DateTime todayMidnight = DateTime.utc(
                                now.year,
                                now.month,
                                now.day,
                              );
                              patientsBloc.add(
                                GetRecords(
                                  patientId: patient.id,
                                  date: todayMidnight,
                                ),
                              );
                            },
                          )
                      ],
                    ),
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
