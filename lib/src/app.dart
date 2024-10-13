import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/config/bloc/main_bloc_provider.dart';
import '/config/routes/router.dart';
import 'features/settings/presentation/bloc/settings_bloc.dart';

class MainApp extends StatelessWidget {
  static final _appRouter = AppRouter();

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBlocProvider(
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          ThemeMode themeMode = ThemeMode.system;
          if (state is ThemeChangeSuccess) themeMode = state.themeMode;

          return MaterialApp.router(
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: themeMode,
            routerConfig: _appRouter.config(),
            locale: PlatformDispatcher.instance.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
