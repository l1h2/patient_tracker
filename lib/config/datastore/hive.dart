import 'package:hive_flutter/hive_flutter.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/user_model.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(PatientAdapter());
}

class HiveBoxes {
  static const String user = 'userBox';
  static const String company = 'companyBox';
  static const String patient = 'patientBox';
}

class HiveKeys {
  static const String user = 'user';
  static const String company = 'company';
  static const String patient = 'patient';
}
