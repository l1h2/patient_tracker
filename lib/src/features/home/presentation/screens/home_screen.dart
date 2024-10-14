import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/home_bloc.dart';
import '../widgets/profile_button.dart';

import '/config/routes/router.gr.dart';
import '/src/core/widgets/entity_list.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double padding = screenSize.width * 0.05;
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ScrollableScaffold(
          appBar: MainAppBar(
            title: locale.companies,
            actionButton: ProfileButton(theme: theme, router: router),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => router.push(AddCompanyRoute()),
            child: const Icon(Icons.add),
          ),
          content: Padding(
            padding: EdgeInsets.fromLTRB(padding, 10, padding, padding * 2),
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
                if (state is SearchingCompanies)
                  const CupertinoActivityIndicator(radius: 16)
                else if (homeBloc.companies.isEmpty)
                  Column(
                    children: [
                      Text(
                        locale.noCompanies,
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 42),
                      SizedBox(
                        height: 56,
                        width: screenSize.width * 0.8,
                        child: OutlinedButton(
                          child: Text(locale.refresh),
                          onPressed: () => homeBloc.add(GetCompanies()),
                        ),
                      ),
                    ],
                  ),
                if (homeBloc.companies.isNotEmpty)
                  EntityList(
                    items: homeBloc.companies,
                    searchController: _searchController,
                    getName: (company) => company.name,
                    onItemTap: (company) => router.push(
                      PatientsRoute(companyId: company.id),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
