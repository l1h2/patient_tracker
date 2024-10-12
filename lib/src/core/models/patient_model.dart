import 'records_model.dart';

class Patient {
  final String id;
  String name;
  final Map<String, Records> records;
  final Set<DateTime> recordDates;

  Patient({
    required this.id,
    required this.name,
    Map<String, Records>? records,
    Set<DateTime>? recordDates,
  })  : records = records ?? {},
        recordDates = recordDates ?? {};

  Patient copyWith(Patient patient) => Patient(
        id: id,
        name: patient.name,
        records: patient.records,
        recordDates:
            patient.recordDates.isEmpty ? recordDates : patient.recordDates,
      );
}
