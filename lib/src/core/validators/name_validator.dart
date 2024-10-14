import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'not_empty_validator.dart';

String? nameValidator(
  String? value,
  AppLocalizations locale,
  String fieldName,
) {
  final String? isEmpty = notEmptyValidator(value, fieldName, locale);

  if (isEmpty != null) return isEmpty;
  if (value!.length > 50) return locale.maxLengthError(fieldName, 50);

  return null;
}

String? newNameValidator(
  String? newValue,
  String currentValue,
  AppLocalizations locale,
  String fieldName,
) =>
    newValue == currentValue
        ? locale.unchangedError
        : nameValidator(newValue, locale, fieldName);
