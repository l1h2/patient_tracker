import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_bloc.dart';

import '/config/assets/assets.dart';
import '/config/routes/router.gr.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final SplashBloc splashBloc = BlocProvider.of<SplashBloc>(context);

    splashBloc.add(SplashCheckAuthentication());

    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          router.replace(HomeRoute());
        } else if (state is SplashNotAuthenticated) {
          router.replace(LoginRoute());
        } else if (state is SplashFailure) {
          router.replace(LoginRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.primary,
          body: Center(
            child: Image.asset(Assets.logoSplash),
          ),
        );
      },
    );
  }
}
