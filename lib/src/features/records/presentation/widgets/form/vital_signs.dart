import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class VitalSignsSection extends StatelessWidget {
  const VitalSignsSection({
    super.key,
    required this.locale,
    required this.vitalSigns,
  });

  final AppLocalizations locale;
  final VitalSigns vitalSigns;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: locale.vitalSigns,
      child: Wrap(
        spacing: 32,
        runSpacing: 10,
        children: [
          NumberInput(
            label: locale.arterialPressure,
            unit: locale.pressureUnit,
            initialValue: vitalSigns.pressure,
            onChanged: (value) => vitalSigns.pressure = value,
          ),
          NumberInput(
            label: locale.heartRate,
            unit: locale.heartRateUnit,
            initialValue: vitalSigns.heartRate,
            onChanged: (value) => vitalSigns.heartRate = value,
          ),
          NumberInput(
            label: locale.oxygenSaturation,
            unit: locale.saturationUnit,
            initialValue: vitalSigns.oxygenSaturation,
            onChanged: (value) => vitalSigns.oxygenSaturation = value,
          ),
        ],
      ),
    );
  }
}
