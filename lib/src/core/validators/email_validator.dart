import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'not_empty_validator.dart';

String? emailValidator(String? value, AppLocalizations locale) {
  final String fieldName = locale.email;
  final String? isEmpty = notEmptyValidator(value, fieldName, locale);

  if (isEmpty != null) return isEmpty;
  if (value!.length > 50) return locale.maxLengthError(fieldName, 50);

  if (value.contains(RegExp(r'\s'))) {
    return locale.fieldInvalidFormatError(fieldName);
  }

  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegExp.hasMatch(value)) {
    return locale.fieldInvalidFormatError(fieldName);
  }

  return null;
}
