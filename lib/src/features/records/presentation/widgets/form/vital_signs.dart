import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class VitalSignsSection extends StatelessWidget {
  const VitalSignsSection({super.key, required this.vitalSigns});

  final VitalSigns vitalSigns;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return CustomExpansionTile(
      title: locale.vitalSigns,
      child: VitalSignsContents(locale: locale, vitalSigns: vitalSigns),
    );
  }
}

class VitalSignsContents extends StatelessWidget {
  const VitalSignsContents({
    super.key,
    required this.locale,
    required this.vitalSigns,
  });

  final AppLocalizations locale;
  final VitalSigns vitalSigns;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 10,
      children: [
        NumberInput(
          label: locale.pressureAbr,
          unit: locale.pressureUnit,
          initialValue: vitalSigns.pressure,
          onChanged: (value) => vitalSigns.pressure = value,
          minValue: 0,
          maxValue: 1000,
        ),
        NumberInput(
          label: locale.heartRateAbr,
          unit: locale.heartRateUnit,
          initialValue: vitalSigns.heartRate,
          onChanged: (value) => vitalSigns.heartRate = value,
          minValue: 0,
          maxValue: 1000,
        ),
        NumberInput(
          label: locale.saturationAbr,
          unit: locale.saturationUnit,
          initialValue: vitalSigns.oxygenSaturation,
          onChanged: (value) => vitalSigns.oxygenSaturation = value,
          minValue: 0,
          maxValue: 100,
        ),
      ],
    );
  }
}
