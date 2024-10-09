import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/bloc/observer.dart';
import 'config/firebase/firebase.dart';
import 'config/locator/setup.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfigure.configureFirebase();
  await setupLocator();
  if (!const bool.fromEnvironment('dart.vm.product')) {
    Bloc.observer = const SimpleBlocObserver();
  }
  runApp(const MainApp());
}
