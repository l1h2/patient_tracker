import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class AccessoriesSection extends StatelessWidget {
  const AccessoriesSection({
    super.key,
    required this.locale,
    required this.accessories,
  });

  final AppLocalizations locale;
  final Accessories accessories;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: locale.accessoriesUsed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(
              value: accessories.ball,
              title: locale.ball,
              onChanged: (value) => accessories.ball = value,
            ),
            CustomCheckbox(
              value: accessories.bosu,
              title: locale.bosu,
              onChanged: (value) => accessories.bosu = value,
            ),
            CustomCheckbox(
              value: accessories.comboBox,
              title: locale.comboBox,
              onChanged: (value) => accessories.comboBox = value,
            ),
            CustomCheckbox(
              value: accessories.proprioceptionDisk,
              title: locale.proprioceptionDisk,
              onChanged: (value) => accessories.proprioceptionDisk = value,
            ),
            CustomCheckbox(
              value: accessories.pushUpSupport,
              title: locale.pushUpSupport,
              onChanged: (value) => accessories.pushUpSupport = value,
            ),
            CustomCheckbox(
              value: accessories.foamRoller,
              title: locale.foamRoller,
              onChanged: (value) => accessories.foamRoller = value,
            ),
            CustomCheckbox(
              value: accessories.myofascialRoller,
              title: locale.myofascialRoller,
              onChanged: (value) => accessories.myofascialRoller = value,
            ),
            CustomCheckbox(
              value: accessories.beanBag,
              title: locale.beanBag,
              onChanged: (value) => accessories.beanBag = value,
            ),
            CustomCheckbox(
              value: accessories.pilatesRing,
              title: locale.pilatesRing,
              onChanged: (value) => accessories.pilatesRing = value,
            ),
            CustomCheckbox(
              value: accessories.pilatesWheel,
              title: locale.pilatesWheel,
              onChanged: (value) => accessories.pilatesWheel = value,
            ),
            CustomCheckbox(
              value: accessories.abdominalWheel,
              title: locale.abdominalWheel,
              onChanged: (value) => accessories.abdominalWheel = value,
            ),
            CustomCheckbox(
              value: accessories.stressBall,
              title: locale.stressBall,
              onChanged: (value) => accessories.stressBall = value,
            ),
            CustomCheckbox(
              value: accessories.massager,
              title: locale.massager,
              onChanged: (value) => accessories.massager = value,
            ),
            CustomCheckbox(
              value: accessories.baton,
              title: locale.baton,
              onChanged: (value) => accessories.baton = value,
            ),
            CustomCheckbox(
              value: accessories.elasticBand,
              title: locale.elasticBand,
              onChanged: (value) => accessories.elasticBand = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberInput(
                  label: locale.dumbbell,
                  unit: locale.weightUnit,
                  initialValue: accessories.dumbbell,
                  onChanged: (value) => accessories.dumbbell = value,
                ),
                const SizedBox(width: 32),
                NumberInput(
                  label: locale.tonningBall,
                  unit: locale.weightUnit,
                  initialValue: accessories.tonningBall,
                  onChanged: (value) => accessories.tonningBall = value,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
