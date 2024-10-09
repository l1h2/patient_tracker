import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/config/bloc/main_bloc_provider.dart';
import '/config/routes/router.dart';
import '/config/themes/themes.dart';

class MainApp extends StatelessWidget {
  static final _appRouter = AppRouter();

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MainBlocProvider(
      child: MaterialApp.router(
        theme: getDarkTheme(screenSize).themeData,
        routerConfig: _appRouter.config(),
        locale: PlatformDispatcher.instance.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
