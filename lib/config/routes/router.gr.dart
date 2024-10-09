// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i13;
import 'package:patient_tracker/src/core/models/company_model.dart' as _i14;
import 'package:patient_tracker/src/core/models/patient_model.dart' as _i16;
import 'package:patient_tracker/src/features/auth/change_password/presentation/screens/change_password_screen.dart'
    as _i3;
import 'package:patient_tracker/src/features/auth/forgot_password/presentation/screens/forgot_password_screen.dart'
    as _i4;
import 'package:patient_tracker/src/features/auth/login/presentation/screens/login_screen.dart'
    as _i6;
import 'package:patient_tracker/src/features/auth/logout/presentation/screens/logout_screen.dart'
    as _i7;
import 'package:patient_tracker/src/features/home/presentation/screens/add_company_screen.dart'
    as _i1;
import 'package:patient_tracker/src/features/home/presentation/screens/home_screen.dart'
    as _i5;
import 'package:patient_tracker/src/features/patients/presentation/screens/add_patient_screen.dart'
    as _i2;
import 'package:patient_tracker/src/features/patients/presentation/screens/patients_screen.dart'
    as _i8;
import 'package:patient_tracker/src/features/records/presentation/screens/records_screen.dart'
    as _i9;
import 'package:patient_tracker/src/features/settings/presentation/screens/settings_menu_screen.dart'
    as _i10;
import 'package:patient_tracker/src/features/splash/presentation/screens/splash_screen.dart'
    as _i11;

/// generated route for
/// [_i1.AddCompanyScreen]
class AddCompanyRoute extends _i12.PageRouteInfo<AddCompanyRouteArgs> {
  AddCompanyRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AddCompanyRoute.name,
          args: AddCompanyRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddCompanyRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddCompanyRouteArgs>(
          orElse: () => const AddCompanyRouteArgs());
      return _i1.AddCompanyScreen(key: args.key);
    },
  );
}

class AddCompanyRouteArgs {
  const AddCompanyRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'AddCompanyRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AddPatientScreen]
class AddPatientRoute extends _i12.PageRouteInfo<AddPatientRouteArgs> {
  AddPatientRoute({
    _i13.Key? key,
    required _i14.Company company,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AddPatientRoute.name,
          args: AddPatientRouteArgs(
            key: key,
            company: company,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPatientRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddPatientRouteArgs>();
      return _i2.AddPatientScreen(
        key: args.key,
        company: args.company,
      );
    },
  );
}

class AddPatientRouteArgs {
  const AddPatientRouteArgs({
    this.key,
    required this.company,
  });

  final _i13.Key? key;

  final _i14.Company company;

  @override
  String toString() {
    return 'AddPatientRouteArgs{key: $key, company: $company}';
  }
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i12.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return _i3.ChangePasswordScreen(key: args.key);
    },
  );
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i12.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i4.ForgotPasswordScreen(key: args.key);
    },
  );
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i15.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i5.HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<LoginRouteArgs>(orElse: () => const LoginRouteArgs());
      return _i6.LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.LogoutScreen]
class LogoutRoute extends _i12.PageRouteInfo<void> {
  const LogoutRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LogoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogoutRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.LogoutScreen();
    },
  );
}

/// generated route for
/// [_i8.PatientsScreen]
class PatientsRoute extends _i12.PageRouteInfo<PatientsRouteArgs> {
  PatientsRoute({
    _i15.Key? key,
    required _i14.Company company,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          PatientsRoute.name,
          args: PatientsRouteArgs(
            key: key,
            company: company,
          ),
          initialChildren: children,
        );

  static const String name = 'PatientsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PatientsRouteArgs>();
      return _i8.PatientsScreen(
        key: args.key,
        company: args.company,
      );
    },
  );
}

class PatientsRouteArgs {
  const PatientsRouteArgs({
    this.key,
    required this.company,
  });

  final _i15.Key? key;

  final _i14.Company company;

  @override
  String toString() {
    return 'PatientsRouteArgs{key: $key, company: $company}';
  }
}

/// generated route for
/// [_i9.RecordsScreen]
class RecordsRoute extends _i12.PageRouteInfo<RecordsRouteArgs> {
  RecordsRoute({
    _i13.Key? key,
    required _i14.Company company,
    required _i16.Patient patient,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RecordsRoute.name,
          args: RecordsRouteArgs(
            key: key,
            company: company,
            patient: patient,
          ),
          initialChildren: children,
        );

  static const String name = 'RecordsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecordsRouteArgs>();
      return _i9.RecordsScreen(
        key: args.key,
        company: args.company,
        patient: args.patient,
      );
    },
  );
}

class RecordsRouteArgs {
  const RecordsRouteArgs({
    this.key,
    required this.company,
    required this.patient,
  });

  final _i13.Key? key;

  final _i14.Company company;

  final _i16.Patient patient;

  @override
  String toString() {
    return 'RecordsRouteArgs{key: $key, company: $company, patient: $patient}';
  }
}

/// generated route for
/// [_i10.SettingsMenuScreen]
class SettingsMenuRoute extends _i12.PageRouteInfo<void> {
  const SettingsMenuRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SettingsMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsMenuRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingsMenuScreen();
    },
  );
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}
