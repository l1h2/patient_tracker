import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/validators/not_empty_validator.dart';
import '/src/core/widgets/selection_checkbox.dart';
import '/src/features/patients/presentation/bloc/patients_bloc.dart';

void editPatientDialog({
  required BuildContext context,
  required String userId,
  required Company company,
  required Patient patient,
}) {
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController(text: patient.name);
  final genderController = BoolController(boolean: patient.isMale);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final AppLocalizations locale = AppLocalizations.of(context)!;
      final ThemeData theme = Theme.of(context);
      final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);

      return Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                locale.editPatient,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: locale.patientName),
                textAlign: TextAlign.center,
                validator: (value) => notEmptyValidator(
                  value,
                  locale.patientName,
                  locale,
                ),
              ),
              SelectionCheckbox(
                trueText: locale.maleAbr,
                falseText: locale.femaleAbr,
                controller: genderController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(locale.cancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                    child: Text(locale.save),
                    onPressed: () {
                      if (patient.name == nameController.text &&
                          patient.isMale == genderController.boolean) {
                        showErrorDialog(context: context);
                        return;
                      }
                      if (key.currentState?.validate() ?? false) {
                        patientsBloc.add(
                          UpdatePatient(
                            userId: userId,
                            company: company,
                            patient: patient,
                            name: nameController.text,
                            isMale: genderController.boolean,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showErrorDialog({
  required BuildContext context,
}) {
  final AppLocalizations locale = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(locale.noChanges, textAlign: TextAlign.center),
        actions: [
          Center(
            child: SizedBox(
              width: 80,
              child: FilledButton(
                child: Text(locale.ok),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      );
    },
  );
}
