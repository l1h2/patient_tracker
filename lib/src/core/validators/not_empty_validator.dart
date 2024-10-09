import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? notEmptyValidator(
  String? value,
  String fieldName,
  AppLocalizations locale,
) {
  if (value == null || value.isEmpty) {
    return locale.fieldEmptyError(fieldName);
  }
  return null;
}
