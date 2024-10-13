import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/settings_bloc.dart';
import '../widgets/settings_menu.dart';

import '/config/routes/router.gr.dart';
import '/src/core/widgets/error_widgets.dart';

@RoutePage()
class SettingsMenuScreen extends StatelessWidget {
  const SettingsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is ThemeChangeFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            locale.themeChangeError,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SettingsLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.settings),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.sunny),
                  onPressed: () => settingsBloc.add(ToggleTheme()),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuButton(
                    router: router,
                    route: ChangePasswordRoute(),
                    text: locale.changePassword,
                    theme: theme,
                  ),
                  const Divider(height: 0),
                  MenuButton(
                    router: router,
                    route: const LogoutRoute(),
                    text: locale.logout,
                    theme: theme,
                  ),
                  const Divider(height: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
