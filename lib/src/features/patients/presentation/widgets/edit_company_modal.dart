import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/company_model.dart';
import '/src/core/validators/name_validator.dart';
import '/src/features/home/presentation/bloc/home_bloc.dart';

void editCompanyDialog({
  required BuildContext context,
  required String userId,
  required Company company,
}) {
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController(text: company.name);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final AppLocalizations locale = AppLocalizations.of(context)!;
      final ThemeData theme = Theme.of(context);
      final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

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
                locale.editCompany,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: locale.companyName),
                textAlign: TextAlign.center,
                validator: (value) => newNameValidator(
                  value,
                  company.name,
                  locale,
                  locale.companyName,
                ),
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
                      if (key.currentState!.validate()) {
                        homeBloc.add(
                          UpdateCompany(
                            userId: userId,
                            company: company,
                            name: nameController.text,
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
