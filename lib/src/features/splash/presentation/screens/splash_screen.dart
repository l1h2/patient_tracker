import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_bloc.dart';

import '/config/assets/assets.dart';
import '/config/routes/router.gr.dart';
import '/src/features/settings/presentation/bloc/settings_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    final SplashBloc splashBloc = BlocProvider.of<SplashBloc>(context);
    final SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    splashBloc.add(SplashCheckAuthentication());

    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          settingsBloc.add(ChangeTheme(state.user.isDarkMode));
          router.replace(HomeRoute());
        } else if (state is SplashNotAuthenticated) {
          router.replace(LoginRoute());
        } else if (state is SplashFailure) {
          router.replace(LoginRoute());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(Assets.logoSplash),
        ),
      ),
    );
  }
}
