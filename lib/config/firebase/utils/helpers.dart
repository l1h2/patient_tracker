import 'package:cloud_firestore/cloud_firestore.dart';

dynamic deleteIfInvalid(dynamic value) {
  if (value is bool) {
    return value == false ? FieldValue.delete() : value;
  } else if (value is String) {
    return value.isEmpty ? FieldValue.delete() : value;
  } else if (value is double) {
    return value == 0 ? FieldValue.delete() : value;
  } else if (value is int) {
    return value == 0 ? FieldValue.delete() : value;
  } else if (value is List) {
    return value.isEmpty ? FieldValue.delete() : value;
  } else if (value is Map) {
    return value.isEmpty ? FieldValue.delete() : value;
  }
  return value;
}

Map<String, dynamic>? getValidMap(
  Map<String, dynamic>? map, {
  required bool isCreate,
}) {
  if (map == null) {
    return null;
  }

  final keysToRemove = <String>[];

  for (final entry in map.entries) {
    if (entry.value == null) {
      keysToRemove.add(entry.key);
      continue;
    }

    map[entry.key] = deleteIfInvalid(entry.value);

    if (isCreate && map[entry.key] == FieldValue.delete()) {
      keysToRemove.add(entry.key);
    }
  }

  keysToRemove.forEach(map.remove);

  return map.isEmpty ? null : map;
}
