import '../entities/records_entity.dart';

import '/src/core/models/records_model.dart';

abstract class RecordsRepository {
  Future<String> saveRecords(RecordsParams params);
  Future<Records?> getRecords(GetRecordsParams params);
  Future<void> deleteRecords(DeleteRecordsParams params);
}
