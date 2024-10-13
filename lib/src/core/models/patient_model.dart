import 'records_model.dart';

class Patient {
  final String id;
  String name;
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
