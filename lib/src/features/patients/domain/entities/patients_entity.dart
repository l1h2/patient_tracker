import 'package:equatable/equatable.dart';

import '/src/core/models/records_model.dart';

class PatientParams extends Equatable {
  final String name;
  final bool isMale;
  final String userId;
  final String companyId;

  const PatientParams({
    required this.name,
    required this.isMale,
    required this.userId,
    required this.companyId,
  });

  @override
  List<Object> get props => [name, isMale, userId, companyId];
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

class UpdatePatientParams extends Equatable {
  final String userId;
  final String companyId;
  final String patientId;
  final String name;
  final bool isMale;

  const UpdatePatientParams({
    required this.userId,
    required this.companyId,
    required this.patientId,
    required this.name,
    required this.isMale,
  });

  @override
  List<Object> get props => [userId, companyId, patientId, name, isMale];
}

class DeletePatientParams extends Equatable {
  final String userId;
  final String companyId;
  final String patientId;

  const DeletePatientParams({
    required this.userId,
    required this.companyId,
    required this.patientId,
  });

  @override
  List<Object> get props => [userId, companyId, patientId];
}

class GetRecordsReturn {
  final Set<DateTime> recordDates;
  final Records? records;

  const GetRecordsReturn({
    required this.recordDates,
    required this.records,
  });
}
