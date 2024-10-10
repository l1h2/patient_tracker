import 'records_model.dart';

class Patient {
  final String id;
  String name;
  final Map<String, Records> records;

  Patient({
    required this.id,
    required this.name,
    Map<String, Records>? records,
  }) : records = records ?? const {};

  Patient copyWith(Patient patient) => Patient(
        id: id,
        name: patient.name,
        records: patient.records.isEmpty ? records : patient.records,
      );
}
