import 'package:cloud_firestore/cloud_firestore.dart';

class RecordDatesDocument {
  final String patientId;
  final Set<DateTime> recordDates;

  const RecordDatesDocument({
    required this.patientId,
    required this.recordDates,
  });

  factory RecordDatesDocument.fromMap(Map<String, dynamic> map) =>
      RecordDatesDocument(
        patientId: map[RecordDatesAttrs.patientId],
        recordDates: (map[RecordDatesAttrs.recordDates] as List)
            .map((timestamp) => (timestamp as Timestamp).toDate().toUtc())
            .toSet(),
      );

  Map<String, dynamic> toMap() => {RecordDatesAttrs.recordDates: recordDates};
}

class RecordDatesAttrs {
  static const patientId = 'patientId';
  static const recordDates = 'recordDates';
}
