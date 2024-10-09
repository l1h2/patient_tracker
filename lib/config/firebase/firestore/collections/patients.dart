import '/src/core/models/patient_model.dart';
import 'records.dart';

class PatientDocument {
  final String? id;
  final String name;
  final List<RecordsDocument>? records;

  const PatientDocument({
    this.id,
    required this.name,
    this.records,
  });

  factory PatientDocument.fromMap(Map<String, dynamic> map) => PatientDocument(
        id: map[PatientAttrs.id],
        name: map[PatientAttrs.name],
      );

  PatientDocument copyWith({required Map<String, dynamic> newAttrs}) {
    if (newAttrs.isEmpty) {
      return this;
    }

    return PatientDocument(
      id: newAttrs[PatientAttrs.id] ?? id,
      name: newAttrs[PatientAttrs.name] ?? name,
      records: newAttrs[PatientAttrs.records] ?? records,
    );
  }

  Map<String, dynamic> toMap() => {PatientAttrs.name: name};

  Patient toPatient() => Patient(
        id: id!,
        name: name,
      );
}

class PatientAttrs {
  static const id = 'id';
  static const name = 'name';
  static const records = 'records';
}
