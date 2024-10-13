import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/records_model.dart';
import 'form_fields.dart';

class ExerciseSection extends StatelessWidget {
  const ExerciseSection({
    super.key,
    required this.locale,
    required this.theme,
    required this.title,
    required this.exercises,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final String title;
  final Exercises exercises;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      title: title,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
            ExerciseContent(locale: locale, theme: theme, exercises: exercises),
      ),
    );
  }
}

class ExerciseContent extends StatelessWidget {
  const ExerciseContent({
    super.key,
    required this.locale,
    required this.theme,
    required this.exercises,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Exercises exercises;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stretching(locale: locale, theme: theme, exercises: exercises),
        Strengthening(locale: locale, theme: theme, exercises: exercises),
        Mobility(locale: locale, theme: theme, exercises: exercises),
        CustomCheckbox(
          value: exercises.relaxation,
          title: locale.relaxation,
          onChanged: (value) => exercises.relaxation = value,
        ),
        CustomCheckbox(
          value: exercises.motorCoordination,
          title: locale.motorCoordinationAbr,
          onChanged: (value) => exercises.motorCoordination = value,
        ),
        CustomCheckbox(
          value: exercises.balance,
          title: locale.balanceTraining,
          onChanged: (value) => exercises.balance = value,
        ),
        CustomCheckbox(
          value: exercises.proprioception,
          title: locale.proprioceptionTraining,
          onChanged: (value) => exercises.proprioception = value,
        ),
        TextInput(
          label: locale.other,
          onChanged: (value) => exercises.other = value,
        ),
      ],
    );
  }
}

class Stretching extends StatelessWidget {
  const Stretching({
    super.key,
    required this.locale,
    required this.theme,
    required this.exercises,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Exercises exercises;

  @override
  Widget build(BuildContext context) {
    return Subsection(
      title: locale.stretching,
      theme: theme,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.stretchCadAnt,
                  title: locale.cadAntAbr,
                  onChanged: (value) => exercises.stretchCadAnt = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.stretchCadLat,
                  title: locale.cadLatAbr,
                  onChanged: (value) => exercises.stretchCadLat = value,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.stretchCadPost,
                  title: locale.cadPostAbr,
                  onChanged: (value) => exercises.stretchCadPost = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.stretchCadCross,
                  title: locale.cadCrossAbr,
                  onChanged: (value) => exercises.stretchCadCross = value,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.stretchMmii,
                  title: locale.mmii,
                  onChanged: (value) => exercises.stretchMmii = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.stretchMmss,
                  title: locale.mmss,
                  onChanged: (value) => exercises.stretchMmss = value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Strengthening extends StatelessWidget {
  const Strengthening({
    super.key,
    required this.locale,
    required this.theme,
    required this.exercises,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Exercises exercises;

  @override
  Widget build(BuildContext context) {
    return Subsection(
      title: locale.strengthening,
      theme: theme,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.strengthMmss,
                  title: locale.mmss,
                  onChanged: (value) => exercises.strengthMmss = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.strengthAbd,
                  title: locale.abdominal,
                  onChanged: (value) => exercises.strengthAbd = value,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.strengthMmii,
                  title: locale.mmii,
                  onChanged: (value) => exercises.strengthMmii = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.strengthPara,
                  title: locale.paravertebral,
                  onChanged: (value) => exercises.strengthPara = value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Mobility extends StatelessWidget {
  const Mobility({
    super.key,
    required this.locale,
    required this.theme,
    required this.exercises,
  });

  final AppLocalizations locale;
  final ThemeData theme;
  final Exercises exercises;

  @override
  Widget build(BuildContext context) {
    return Subsection(
      title: locale.mobilityTraining,
      theme: theme,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.mobilitySpine,
                  title: locale.spine,
                  onChanged: (value) => exercises.mobilitySpine = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.mobilityHip,
                  title: locale.hip,
                  onChanged: (value) => exercises.mobilityHip = value,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.mobilityShoulder,
                  title: locale.shoulder,
                  onChanged: (value) => exercises.mobilityShoulder = value,
                ),
              ),
              Expanded(
                child: CustomCheckbox(
                  value: exercises.mobilityWrist,
                  title: locale.wrist,
                  onChanged: (value) => exercises.mobilityWrist = value,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomCheckbox(
                  value: exercises.mobilityAnkle,
                  title: locale.ankle,
                  onChanged: (value) => exercises.mobilityAnkle = value,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
