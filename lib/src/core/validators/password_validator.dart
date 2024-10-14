import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'not_empty_validator.dart';

String? passwordValidator(String? value, AppLocalizations locale) {
  final String fieldName = locale.password;
  final String? isEmpty = notEmptyValidator(value, fieldName, locale);

  if (isEmpty != null) return isEmpty;
  if (value!.length > 50) return locale.maxLengthError(fieldName, 50);

  final RegExp minLength = RegExp(r'^.{8,}$');
  final RegExp hasNumber = RegExp(r'(?=.*\d)');
  final RegExp hasSpecialChar = RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])');
  final RegExp hasUppercase = RegExp(r'(?=.*[A-Z])');
  final RegExp hasLowercase = RegExp(r'(?=.*[a-z])');

  if (!minLength.hasMatch(value)) return locale.passwordMinLengthError(8);
  if (!hasNumber.hasMatch(value)) return locale.passwordNumberError;
  if (!hasSpecialChar.hasMatch(value)) return locale.passwordSpecialCharError;
  if (!hasUppercase.hasMatch(value)) return locale.passwordUppercaseError;
  if (!hasLowercase.hasMatch(value)) return locale.passwordLowercaseError;

  return null;
}

String? newPasswordValidator(
  String? value,
  String currentPassword,
  AppLocalizations locale,
) {
  if (value == currentPassword) {
    return locale.passwordMatchError;
  }

  return passwordValidator(value, locale);
}

String? confirmPasswordValidator(
  String? value,
  String password,
  AppLocalizations locale,
) {
  if (value != password) {
    return locale.passwordMismatchError;
  }

  return null;
}
