import '../../domain/entities/records_entity.dart';
import '../../domain/repositories/records_repository.dart';
import '../services/records_service.dart';

import '/src/core/models/records_model.dart';

class FirebaseRecordsRepository implements RecordsRepository {
  final RecordsService _service;

  const FirebaseRecordsRepository(this._service);

  @override
  Future<String> saveRecords(RecordsParams params) async {
    return await _service.saveRecords(params);
  }

  @override
  Future<Records?> getRecords(GetRecordsParams params) async {
    return await _service.getRecords(params);
  }

  @override
  Future<void> deleteRecords(DeleteRecordsParams params) async {
    await _service.deleteRecords(params);
  }
}
