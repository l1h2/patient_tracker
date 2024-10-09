import 'package:get_it/get_it.dart';

import 'setup_firebase.dart';
import 'setup_forgot_password.dart';
import 'setup_home.dart';
import 'setup_login.dart';
import 'setup_logout.dart';
import 'setup_password.dart';
import 'setup_patients.dart';
import 'setup_splash.dart';
import 'setup_user.dart';

final locator = GetIt.I;

Future<void> setupLocator() async {
  setupUserLocator(locator);
  setupFirebaseLocator(locator);
  setupSplashLocator(locator);
  setupLoginLocator(locator);
  setupForgotPasswordLocator(locator);
  setupPasswordLocator(locator);
  setupLogoutLocator(locator);
  setupHomeLocator(locator);
  setupPatientsLocator(locator);

  // Wait for all async singletons to be ready
  await locator.allReady();
}
