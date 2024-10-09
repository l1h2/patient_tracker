import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/config/routes/router.gr.dart';
import '/src/core/widgets/error_widgets.dart';
import '../bloc/logout_bloc.dart';

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

    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
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
                  const SizedBox(height: 36),
                  ElevatedButton(
                    child: Text(locale.logoutConfirmAction),
                    onPressed: () => logoutBloc.add(LogoutRequest()),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    child: Text(locale.cancel),
                    onPressed: () {
                      router.maybePop();
                    },
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
