import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'not_empty_validator.dart';

/// Validates an email address.
///
/// The [value] parameter represents the email address to be validated.
/// The [locale] parameter is an instance of [AppLocalizations] used for localization.
///
/// Returns `null` if the email address is valid.
String? emailValidator(String? value, AppLocalizations locale) {
  final String fieldName = locale.email;
  final String? isEmpty = notEmptyValidator(value, fieldName, locale);

  if (isEmpty != null) {
    return isEmpty;
  }

  if (value!.contains(RegExp(r'\s'))) {
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
