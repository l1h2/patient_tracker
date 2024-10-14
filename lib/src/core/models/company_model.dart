import 'package:hive/hive.dart';

import 'patient_model.dart';

part 'company_model.g.dart';

@HiveType(typeId: 1)
class Company {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final Map<String, Patient> patients;

  Company({
    required this.id,
    required this.name,
    Map<String, Patient>? patients,
  }) : patients = patients ?? {};

  Company copyWith(String name) => Company(
        id: id,
        name: name,
        patients: patients,
      );
}
