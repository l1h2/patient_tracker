import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/records_bloc.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/models/user_model.dart';
import 'accessories_section.dart';
import 'comments_section.dart';
import 'exercises.dart';
import 'general_information.dart';
import 'physiotherapy_section.dart';
import 'vital_signs.dart';
import 'warm_up.dart';

class RecordsForm extends StatelessWidget {
  RecordsForm({
    super.key,
    required this.locale,
    required this.recordsBloc,
    required this.user,
    required this.company,
    required this.patient,
    required this.records,
  });

  final AppLocalizations locale;
  final RecordsBloc recordsBloc;
  final User user;
  final Company company;
  final Patient patient;
  final Records records;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 80),
        child: Column(
          children: [
            GeneralInformation(locale: locale, theme: theme, records: records),
            const SizedBox(height: 10),
            VitalSignsSection(locale: locale, vitalSigns: records.vitalSigns),
            WarmUpSection(locale: locale, theme: theme, warmUp: records.warmUp),
            ExerciseSection(
              locale: locale,
              theme: theme,
              title: locale.barrel,
              exercises: records.barrel,
            ),
            ExerciseSection(
              locale: locale,
              theme: theme,
              title: locale.cadillac,
              exercises: records.cadillac,
            ),
            ExerciseSection(
              locale: locale,
              theme: theme,
              title: locale.stepChair,
              exercises: records.stepChair,
            ),
            ExerciseSection(
              locale: locale,
              theme: theme,
              title: locale.reformer,
              exercises: records.reformer,
            ),
            ExerciseSection(
              locale: locale,
              theme: theme,
              title: locale.columpio,
              exercises: records.columpio,
            ),
            ExerciseSection(
              locale: locale,
              theme: theme,
              title: locale.solo,
              exercises: records.solo,
            ),
            AccessoriesSection(
                locale: locale, accessories: records.accessories),
            PhysiotherapySection(
              locale: locale,
              theme: theme,
              physiotherapy: records.physiotherapy,
            ),
            CommentsSection(locale: locale, theme: theme, records: records),
            const SizedBox(height: 30),
            SizedBox(
              height: 56,
              width: screenWidth * 0.8,
              child: FilledButton(
                child: Text(locale.save),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    recordsBloc.add(
                      SaveRecords(
                        user: user,
                        company: company,
                        patient: patient,
                        records: records,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
