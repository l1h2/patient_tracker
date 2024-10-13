import '/src/core/models/patient_model.dart';
import 'records.dart';

class PatientDocument {
  final String? id;
  final String name;
  final bool isMale;
  final List<RecordsDocument>? records;

  const PatientDocument({
    this.id,
    required this.name,
    required this.isMale,
    this.records,
  });

  factory PatientDocument.fromMap(Map<String, dynamic> map) => PatientDocument(
        id: map[PatientAttrs.id],
        name: map[PatientAttrs.name],
        isMale: map[PatientAttrs.isMale],
      );

  PatientDocument copyWith({required Map<String, dynamic> newAttrs}) {
    if (newAttrs.isEmpty) {
      return this;
    }

    return PatientDocument(
      id: newAttrs[PatientAttrs.id] ?? id,
      name: newAttrs[PatientAttrs.name] ?? name,
      isMale: newAttrs[PatientAttrs.isMale] ?? isMale,
      records: newAttrs[PatientAttrs.records] ?? records,
    );
  }

  Map<String, dynamic> toMap() => {
        PatientAttrs.name: name,
        PatientAttrs.isMale: isMale,
      };

  Patient toPatient() => Patient(
        id: id!,
        name: name,
        isMale: isMale,
      );
}

class PatientAttrs {
  static const id = 'id';
  static const name = 'name';
  static const isMale = 'isMale';
  static const records = 'records';
}
