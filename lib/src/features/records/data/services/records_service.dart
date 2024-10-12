import '../../domain/entities/records_entity.dart';

import '/src/core/models/records_model.dart';

abstract class RecordsService {
  Future<Records> saveRecords(RecordsParams params);
  Future<Records?> getRecords(GetRecordsParams params);
}
