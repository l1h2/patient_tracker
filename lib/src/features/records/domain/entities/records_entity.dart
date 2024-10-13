import 'package:equatable/equatable.dart';

import '/src/core/models/records_model.dart';

class RecordsParams extends Equatable {
  final String userId;
  final String companyId;
  final String patientId;
  final Records records;

  const RecordsParams({
    required this.userId,
    required this.companyId,
    required this.patientId,
    required this.records,
  });

  @override
  List<Object> get props => [userId, companyId, patientId, records];
}

class GetRecordsParams extends Equatable {
  final String userId;
  final String companyId;
  final String patientId;
  final DateTime date;

  const GetRecordsParams({
    required this.userId,
    required this.companyId,
    required this.patientId,
    required this.date,
  });

  @override
  List<Object> get props => [userId, companyId, patientId, date];
}

class DeleteRecordsParams extends Equatable {
  final String userId;
  final String companyId;
  final String patientId;
  final String recordsId;
  final DateTime date;

  const DeleteRecordsParams({
    required this.userId,
    required this.companyId,
    required this.patientId,
    required this.recordsId,
    required this.date,
  });

  @override
  List<Object> get props => [userId, companyId, patientId, recordsId, date];
}
