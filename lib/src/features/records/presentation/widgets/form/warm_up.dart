import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class WarmUpSection extends StatelessWidget {
  const WarmUpSection({
    super.key,
    required this.locale,
    required this.theme,
    required this.warmUp,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final WarmUp warmUp;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: locale.warmUp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(
              value: warmUp.functionalAerobic,
              title: locale.functionalAerobic,
              onChanged: (value) => warmUp.functionalAerobic = value,
            ),
            CustomCheckbox(
              value: warmUp.plyometricReformer,
              title: locale.plyometricReformer,
              onChanged: (value) => warmUp.plyometricReformer = value,
            ),
            CustomCheckbox(
              value: warmUp.plyometricWall,
              title: locale.plyometricWall,
              onChanged: (value) => warmUp.plyometricWall = value,
            ),
            Subsection(
              title: locale.swimming,
              theme: theme,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCheckbox(
                    value: warmUp.swimmingSolo,
                    title: locale.solo,
                    onChanged: (value) => warmUp.swimmingSolo = value,
                  ),
                  CustomCheckbox(
                    value: warmUp.swimmingBarrel,
                    title: locale.barrel,
                    onChanged: (value) => warmUp.swimmingBarrel = value,
                  ),
                ],
              ),
            ),
            CustomCheckbox(
              value: warmUp.hundredSolo,
              title: locale.hundredSolo,
              onChanged: (value) => warmUp.hundredSolo = value,
            ),
            CustomCheckbox(
              value: warmUp.hundredReformer,
              title: locale.hundredReformer,
              onChanged: (value) => warmUp.hundredReformer = value,
            ),
            TextInput(
              label: locale.other,
              initialValue: warmUp.other,
              onChanged: (value) => warmUp.other = value,
            ),
          ],
        ),
      ),
    );
  }
}
