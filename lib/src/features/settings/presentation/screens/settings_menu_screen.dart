import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/settings_menu.dart';

import '/config/routes/router.gr.dart';

@RoutePage()
class SettingsMenuScreen extends StatelessWidget {
  const SettingsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
        actions: [
          IconButton(
            icon: const Icon(Icons.sunny),
            onPressed: () {},
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
              brandText: true,
            ),
            const Divider(height: 0),
          ],
        ),
      ),
    );
  }
}
