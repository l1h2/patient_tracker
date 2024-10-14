part of 'records_bloc.dart';

sealed class RecordsState extends Equatable {
  const RecordsState();

  @override
  List<Object> get props => [];
}

final class RecordsInitial extends RecordsState {}

final class RecordsLoading extends RecordsState {}

final class SearchingRecords extends RecordsState {}

final class GetRecordsSuccess extends RecordsState {}

final class NoRecordsFound extends RecordsState {}

final class NoChangesToSave extends RecordsState {}

final class EmptyRecords extends RecordsState {}

final class RecordsSuccess extends RecordsState {}

final class DeleteRecordsSuccess extends RecordsState {}

final class GetRecordsFailure extends RecordsState {
  final String error;

  const GetRecordsFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class RecordsFailure extends RecordsState {
  final String error;

  const RecordsFailure(this.error);

  @override
  List<Object> get props => [error];
}
