import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class AccessoriesSection extends StatelessWidget {
  const AccessoriesSection({super.key, required this.accessories});

  final Accessories accessories;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return CustomExpansionTile(
      title: locale.accessoriesUsed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: AccessoriesContent(accessories: accessories, locale: locale),
      ),
    );
  }
}

class AccessoriesContent extends StatelessWidget {
  const AccessoriesContent({
    super.key,
    required this.accessories,
    required this.locale,
  });

  final Accessories accessories;
  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          title: locale.elasticBandAndMiniband,
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
              minValue: 0,
              maxValue: 100,
            ),
            const SizedBox(width: 32),
            NumberInput(
              label: locale.tonningBall,
              unit: locale.weightUnit,
              initialValue: accessories.tonningBall,
              onChanged: (value) => accessories.tonningBall = value,
              minValue: 0,
              maxValue: 100,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberInput(
              label: locale.shinGuard,
              unit: locale.weightUnit,
              initialValue: accessories.shinGuard,
              onChanged: (value) => accessories.shinGuard = value,
              minValue: 0,
              maxValue: 100,
            ),
            const SizedBox(width: 32),
            const SizedBox(width: 150),
          ],
        ),
      ],
    );
  }
}
