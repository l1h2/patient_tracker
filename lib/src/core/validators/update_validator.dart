import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'not_empty_validator.dart';

String? updateValidator(
  String? newValue,
  String currentValue,
  AppLocalizations locale,
  String fieldName,
) {
  final String? isEmpty = notEmptyValidator(newValue, fieldName, locale);

  if (isEmpty != null) {
    return isEmpty;
  }

  if (newValue == currentValue) {
    return locale.unchangedError;
  }

  return null;
}
