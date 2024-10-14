import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String? notEmptyValidator(
  String? value,
  String fieldName,
  AppLocalizations locale,
) =>
    value == null || value.isEmpty ? locale.fieldEmptyError(fieldName) : null;
