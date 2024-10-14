part of 'records_bloc.dart';

sealed class RecordsEvent extends Equatable {
  const RecordsEvent();

  @override
  List<Object> get props => [];
}

class SaveRecords extends RecordsEvent {}

class GetRecords extends RecordsEvent {
  final DateTime date;

  const GetRecords({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}

class DeleteRecords extends RecordsEvent {}
