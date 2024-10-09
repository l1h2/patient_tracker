import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';

import '/firebase_options.dart';

class FirebaseConfigure {
  static Future<void> configureFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      log('An error occurred configuring Firebase: $e');
      rethrow;
    }
  }
}
