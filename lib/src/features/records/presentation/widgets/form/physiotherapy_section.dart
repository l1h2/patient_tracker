import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class PhysiotherapySection extends StatelessWidget {
  const PhysiotherapySection({super.key, required this.physiotherapy});

  final Physiotherapy physiotherapy;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return CustomExpansionTile(
      title: locale.physiotherapy,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: PhysiotherapyContent(
          locale: locale,
          theme: theme,
          physiotherapy: physiotherapy,
        ),
      ),
    );
  }
}

class PhysiotherapyContent extends StatelessWidget {
  const PhysiotherapyContent({
    super.key,
    required this.locale,
    required this.theme,
    required this.physiotherapy,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Physiotherapy physiotherapy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckbox(
          value: physiotherapy.stretching,
          title: locale.stretching,
          onChanged: (value) => physiotherapy.stretching = value,
        ),
        CustomCheckbox(
          value: physiotherapy.cryotherapy,
          title: locale.cryotherapy,
          onChanged: (value) => physiotherapy.cryotherapy = value,
        ),
        CustomCheckbox(
          value: physiotherapy.thermotherapy,
          title: locale.thermotherapy,
          onChanged: (value) => physiotherapy.thermotherapy = value,
        ),
        CustomCheckbox(
          value: physiotherapy.gaitTraining,
          title: locale.gaitTraining,
          onChanged: (value) => physiotherapy.gaitTraining = value,
        ),
        CustomCheckbox(
          value: physiotherapy.jointMobilization,
          title: locale.jointMobilization,
          onChanged: (value) => physiotherapy.jointMobilization = value,
        ),
        CustomCheckbox(
          value: physiotherapy.massotherapy,
          title: locale.massotherapy,
          onChanged: (value) => physiotherapy.massotherapy = value,
        ),
        CustomCheckbox(
          value: physiotherapy.williams,
          title: locale.williamsExercises,
          onChanged: (value) => physiotherapy.williams = value,
        ),
        CustomCheckbox(
          value: physiotherapy.codman,
          title: locale.codmanExercises,
          onChanged: (value) => physiotherapy.codman = value,
        ),
        CustomCheckbox(
          value: physiotherapy.mckenzie,
          title: locale.mckenzieExercises,
          onChanged: (value) => physiotherapy.mckenzie = value,
        ),
        CustomCheckbox(
          value: physiotherapy.klapp,
          title: locale.klappExercises,
          onChanged: (value) => physiotherapy.klapp = value,
        ),
        CustomCheckbox(
          value: physiotherapy.rpg,
          title: locale.rpg,
          onChanged: (value) => physiotherapy.rpg = value,
        ),
        CustomCheckbox(
          value: physiotherapy.muscleStrengthening,
          title: locale.muscleStrengtheningAbr,
          onChanged: (value) => physiotherapy.muscleStrengthening = value,
        ),
        CustomCheckbox(
          value: physiotherapy.activeExercises,
          title: locale.activeExercises,
          onChanged: (value) => physiotherapy.activeExercises = value,
        ),
        CustomCheckbox(
          value: physiotherapy.passiveExercises,
          title: locale.passiveExercises,
          onChanged: (value) => physiotherapy.passiveExercises = value,
        ),
        CustomCheckbox(
          value: physiotherapy.assistedExercises,
          title: locale.assistedExercises,
          onChanged: (value) => physiotherapy.assistedExercises = value,
        ),
        CustomCheckbox(
          value: physiotherapy.bandage,
          title: locale.bandage,
          onChanged: (value) => physiotherapy.bandage = value,
        ),
        CustomCheckbox(
          value: physiotherapy.homework,
          title: locale.homework,
          onChanged: (value) => physiotherapy.homework = value,
        ),
        CustomCheckbox(
          value: physiotherapy.footwearChange,
          title: locale.footwearChange,
          onChanged: (value) => physiotherapy.footwearChange = value,
        ),
        Subsection(
          title: locale.isometry,
          theme: theme,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomCheckbox(
                      value: physiotherapy.isometricMmss,
                      title: locale.mmss,
                      onChanged: (value) => physiotherapy.isometricMmss = value,
                    ),
                  ),
                  Expanded(
                    child: CustomCheckbox(
                      value: physiotherapy.isometricAbd,
                      title: locale.abdominal,
                      onChanged: (value) => physiotherapy.isometricAbd = value,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomCheckbox(
                      value: physiotherapy.isometricMmii,
                      title: locale.mmii,
                      onChanged: (value) => physiotherapy.isometricMmii = value,
                    ),
                  ),
                  Expanded(
                    child: TextInput(
                      label: locale.other,
                      onChanged: (value) =>
                          physiotherapy.isometricOther = value,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        TextInput(
          label: locale.tens,
          onChanged: (value) => physiotherapy.tens = value,
        ),
        TextInput(
          label: locale.fes,
          onChanged: (value) => physiotherapy.fes = value,
        ),
        TextInput(
          label: locale.ultrasound,
          onChanged: (value) => physiotherapy.ultrasound = value,
        ),
      ],
    );
  }
}
