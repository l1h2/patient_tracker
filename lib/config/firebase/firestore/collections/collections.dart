class Collections {
  static const String users = 'users';
  static const String companies = 'companies';
  static const String patients = 'patients';
  static const String records = 'records';
  static const String recordDates = 'recordDates';
}

class CollectionPaths {
  static const String users = Collections.users;
  static String companies(String userId) =>
      '$users/$userId/${Collections.companies}';
  static String patients(String userId, String companyId) =>
      '${companies(userId)}/$companyId/${Collections.patients}';
  static String records(String userId, String companyId, String patientId) =>
      '${patients(userId, companyId)}/$patientId/${Collections.records}';
  static String recordDates = Collections.recordDates;
}
