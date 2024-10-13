part of 'records_bloc.dart';

sealed class RecordsEvent extends Equatable {
  const RecordsEvent();

  @override
  List<Object> get props => [];
}

class SaveRecords extends RecordsEvent {
  final User user;
  final Company company;
  final Patient patient;
  final Records records;

  const SaveRecords({
    required this.user,
    required this.company,
    required this.patient,
    required this.records,
  });

  @override
  List<Object> get props => [user, company, patient, records];
}

class GetRecords extends RecordsEvent {
  final User user;
  final Company company;
  final Patient patient;
  final DateTime date;

  const GetRecords({
    required this.user,
    required this.company,
    required this.patient,
    required this.date,
  });

  @override
  List<Object> get props => [user, company, patient, date];
}

class DeleteRecords extends RecordsEvent {
  final User user;
  final Company company;
  final Patient patient;
  final Records records;

  const DeleteRecords({
    required this.user,
    required this.company,
    required this.patient,
    required this.records,
  });

  @override
  List<Object> get props => [user, company, patient, records];
}
