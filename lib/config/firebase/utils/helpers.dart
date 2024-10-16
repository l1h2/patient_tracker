import 'package:cloud_firestore/cloud_firestore.dart';

dynamic deleteIfInvalid(dynamic value) {
  final conditions = {
    bool: (v) => (v as bool) == false,
    String: (v) => (v as String).isEmpty,
    double: (v) => (v as double) == 0,
    int: (v) => (v as int) == 0,
    List: (v) => (v as List).isEmpty,
    Map: (v) => (v as Map).isEmpty,
  };

  final bool Function(dynamic)? checkFunction = conditions[value.runtimeType];

  if (checkFunction == null || !checkFunction(value)) return value;
  return FieldValue.delete();
}

Map<String, dynamic>? getValidMap(
  Map<String, dynamic>? map, {
  required bool isCreate,
}) {
  if (map == null) return null;

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
