import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/locator/setup.dart';
import '/src/features/auth/change_password/presentation/bloc/password_bloc.dart';
import '/src/features/auth/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import '/src/features/auth/login/presentation/bloc/login_bloc.dart';
import '/src/features/auth/logout/presentation/bloc/logout_bloc.dart';
import '/src/features/home/presentation/bloc/home_bloc.dart';
import '/src/features/patients/presentation/bloc/patients_bloc.dart';
import '/src/features/records/presentation/bloc/records_bloc.dart';
import '/src/features/settings/presentation/bloc/settings_bloc.dart';
import '/src/features/splash/presentation/bloc/splash_bloc.dart';

class MainBlocProvider extends StatelessWidget {
  const MainBlocProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc(locator.get())),
        BlocProvider(create: (_) => SettingsBloc(locator.get())),
        BlocProvider(create: (_) => LoginBloc(locator.get())),
        BlocProvider(create: (_) => ForgotPasswordBloc(locator.get())),
        BlocProvider(create: (_) => LogoutBloc(locator.get())),
        BlocProvider(create: (_) => PasswordBloc(locator.get())),
        BlocProvider(create: (_) => HomeBloc(locator.get())),
        BlocProvider(create: (_) => PatientsBloc(locator.get())),
        BlocProvider(create: (_) => RecordsBloc(locator.get())),
      ],
      child: child,
    );
  }
}
