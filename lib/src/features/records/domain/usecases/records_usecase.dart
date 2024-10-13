import '../entities/records_entity.dart';
import '../repositories/records_repository.dart';

import '/src/core/models/records_model.dart';
import '/src/core/utils/usecase.dart';

class RecordsUseCase implements UseCase<String, RecordsParams> {
  RecordsUseCase(this._repository);

  final RecordsRepository _repository;

  @override
  Future<String> call(RecordsParams params) async {
    return await _repository.saveRecords(params);
  }

  Future<Records?> getRecords(GetRecordsParams params) async {
    return await _repository.getRecords(params);
  }
}
