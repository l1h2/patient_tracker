import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'not_empty_validator.dart';

String? textValidator(
  String? value,
  AppLocalizations locale,
  String fieldName,
) =>
    value != null && value.length > 255
        ? locale.maxLengthError(fieldName, 255)
        : null;

String? numberValidator(
  String? value,
  AppLocalizations locale,
  String fieldName, {
  double minValue = double.negativeInfinity,
  double maxValue = double.infinity,
}) {
  if (notEmptyValidator(value, fieldName, locale) != null) return null;

  final numberRegExp = RegExp(r'^[0-9]*([.,][0-9]+)?$');

  if (!numberRegExp.hasMatch(value!)) {
    return locale.numberInvalidFormatError(fieldName);
  }

  final double numberValue = double.parse(value.replaceAll(',', '.'));

  if (numberValue < minValue) {
    return locale.numberMinValueError(fieldName, minValue);
  }

  if (numberValue > maxValue) {
    return locale.numberMaxValueError(fieldName, maxValue);
  }

  return null;
}
