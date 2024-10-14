import 'package:hive/hive.dart';

import 'records_model.dart';

part 'patient_model.g.dart';

@HiveType(typeId: 2)
class Patient {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  bool isMale;

  final Map<String, Records> records;
  final Set<DateTime> recordDates;

  Patient({
    required this.id,
    required this.name,
    required this.isMale,
    Map<String, Records>? records,
    Set<DateTime>? recordDates,
  })  : records = records ?? {},
        recordDates = recordDates ?? {};

  Patient copyWith(Patient patient) => Patient(
        id: id,
        name: patient.name,
        isMale: patient.isMale,
        records: patient.records,
        recordDates:
            patient.recordDates.isEmpty ? recordDates : patient.recordDates,
      );
}
