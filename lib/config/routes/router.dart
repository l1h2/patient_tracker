import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AddCompanyRoute.page),
        AutoRoute(page: SettingsMenuRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: LogoutRoute.page),
        AutoRoute(page: PatientsRoute.page),
        AutoRoute(page: AddPatientRoute.page),
        AutoRoute(page: RecordsRoute.page),
      ];
}
