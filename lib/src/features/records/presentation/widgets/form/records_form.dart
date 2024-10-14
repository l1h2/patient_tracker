import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/records_bloc.dart';

import '/src/core/models/records_model.dart';
import 'accessories_section.dart';
import 'comments_section.dart';
import 'exercises.dart';
import 'vital_signs.dart';
import 'warm_up.dart';

class RecordsForm extends StatelessWidget {
  RecordsForm({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final double screenWidth = MediaQuery.of(context).size.width;
    final RecordsBloc recordsBloc = BlocProvider.of<RecordsBloc>(context);

    final Records records = recordsBloc.currentRecords;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 80),
        child: Column(
          children: [
            // GeneralInformation(records: records),
            const SizedBox(height: 10),
            VitalSignsSection(vitalSigns: records.vitalSigns),
            WarmUpSection(warmUp: records.warmUp),
            ExerciseSection(title: locale.barrel, exercises: records.barrel),
            ExerciseSection(
              title: locale.cadillac,
              exercises: records.cadillac,
            ),
            ExerciseSection(
              title: locale.stepChair,
              exercises: records.stepChair,
            ),
            ExerciseSection(
              title: locale.reformer,
              exercises: records.reformer,
            ),
            ExerciseSection(
              title: locale.columpio,
              exercises: records.columpio,
            ),
            ExerciseSection(title: locale.solo, exercises: records.solo),
            AccessoriesSection(accessories: records.accessories),
            // PhysiotherapySection(physiotherapy: records.physiotherapy),
            CommentsSection(records: records),
            const SizedBox(height: 30),
            SizedBox(
              height: 56,
              width: screenWidth * 0.8,
              child: FilledButton(
                child: Text(locale.save),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    recordsBloc.add(SaveRecords());
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
