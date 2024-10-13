import 'package:intl/intl.dart';

dynamic getDefaultValue(dynamic value, dynamic newValue) {
  if (value is bool || newValue is bool) {
    return value == newValue ? null : newValue ?? false;
  } else if (value is String || newValue is String) {
    return value == newValue ? null : newValue ?? '';
  } else if (value is double || newValue is double) {
    return value == newValue ? null : newValue ?? 0.0;
  } else if (value is int || newValue is int) {
    return value == newValue ? null : newValue ?? 0;
  }

  return value;
}

String getNumberString(double? number) {
  if (number == null) {
    return '';
  }

  final formatter = NumberFormat('###.##');
  return formatter.format(number);
}
