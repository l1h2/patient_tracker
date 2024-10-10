import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/config/bloc/main_bloc_provider.dart';
import '/config/routes/router.dart';

class MainApp extends StatelessWidget {
  static final _appRouter = AppRouter();

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBlocProvider(
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: ThemeMode.dark,
        routerConfig: _appRouter.config(),
        locale: PlatformDispatcher.instance.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
