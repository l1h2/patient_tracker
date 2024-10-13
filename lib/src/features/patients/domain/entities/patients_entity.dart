import 'package:equatable/equatable.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/models/user_model.dart';

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
  final User user;
  final Company company;
  final Patient patient;
  final DateTime date;

  const GetRecordsParams({
    required this.user,
    required this.company,
    required this.patient,
    required this.date,
  });

  @override
  List<Object> get props => [user, company, patient, date];
}

class UpdatePatientParams extends Equatable {
  final String userId;
  final String companyId;
  final Patient patient;
  final String name;
  final bool isMale;

  const UpdatePatientParams({
    required this.userId,
    required this.companyId,
    required this.patient,
    required this.name,
    required this.isMale,
  });

  @override
  List<Object> get props => [userId, companyId, patient, name, isMale];
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
