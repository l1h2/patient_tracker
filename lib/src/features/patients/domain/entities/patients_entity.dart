import 'package:equatable/equatable.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/models/user_model.dart';

class PatientParams extends Equatable {
  final String name;
  final String userId;
  final String companyId;

  const PatientParams({
    required this.name,
    required this.userId,
    required this.companyId,
  });

  @override
  List<Object> get props => [name, userId, companyId];
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

class GetRecordsReturn {
  final Set<DateTime> recordDates;
  final Records? records;

  const GetRecordsReturn({
    required this.recordDates,
    required this.records,
  });
}
