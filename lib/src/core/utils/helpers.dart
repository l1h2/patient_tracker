import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

dynamic getDefaultValue(dynamic value, dynamic newValue) {
  final defaultValues = {
    bool: false,
    String: '',
    double: 0.0,
    int: 0,
    List: [],
    Map: {},
  };

  for (var type in defaultValues.keys) {
    if (value.runtimeType == type || newValue.runtimeType == type) {
      return value == newValue ? null : newValue ?? defaultValues[type];
    }
  }

  return value;
}

String getNumberString(double? number) =>
    number == null ? '' : NumberFormat('###.##').format(number);

String getDateString(AppLocalizations locale, DateTime? date) =>
    date == null ? '' : DateFormat.yMd(locale.localeName).format(date);
