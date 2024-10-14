import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/logout_bloc.dart';

import '/config/routes/router.gr.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/features/settings/presentation/bloc/settings_bloc.dart';

@RoutePage()
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final Size screenSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final LogoutBloc logoutBloc = BlocProvider.of<LogoutBloc>(context);
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          settingsBloc.add(ResetTheme());
          router.replaceAll([LoginRoute()]);
        } else if (state is LogoutFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogoutLoading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.logout),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.05),
              child: Column(
                children: [
                  Text(
                    locale.logoutConfirmation,
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 56),
                  SizedBox(
                    height: 56,
                    width: screenSize.width * 0.8,
                    child: FilledButton(
                      child: Text(locale.logoutConfirmAction),
                      onPressed: () => logoutBloc.add(LogoutRequest()),
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 56,
                    width: screenSize.width * 0.8,
                    child: OutlinedButton(
                      child: Text(locale.cancel),
                      onPressed: () {
                        router.maybePop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
