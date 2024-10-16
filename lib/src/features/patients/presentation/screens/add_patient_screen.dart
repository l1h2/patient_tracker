import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/patients_bloc.dart';

import '/src/core/validators/name_validator.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';
import '/src/core/widgets/selection_checkbox.dart';

@RoutePage()
class AddPatientScreen extends StatelessWidget {
  AddPatientScreen({super.key});

  final _patientNameController = TextEditingController();
  final _genderController = BoolController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);

    return BlocConsumer<PatientsBloc, PatientsState>(
      listener: (context, state) {
        if (state is AddPatientSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                locale.addPatientSuccess,
                textAlign: TextAlign.center,
              ),
            ),
          );
          router.maybePop();
        } else if (state is AddPatientFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is PatientsLoading,
          child: ScrollableScaffold(
            appBar: MainAppBar(title: locale.addPatient),
            content: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _patientNameController,
                      decoration: InputDecoration(hintText: locale.patientName),
                      validator: (value) => nameValidator(
                        value,
                        locale,
                        locale.patientName,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SelectionCheckbox(
                      trueText: locale.maleAbr,
                      falseText: locale.femaleAbr,
                      alignment: MainAxisAlignment.center,
                      controller: _genderController,
                    ),
                    const SizedBox(height: 46),
                    SizedBox(
                      height: 56,
                      width: screenSize.width * 0.8,
                      child: FilledButton(
                        child: Text(locale.add),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            patientsBloc.add(
                              AddPatient(
                                _patientNameController.text,
                                _genderController.boolean,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 56,
                      width: screenSize.width * 0.8,
                      child: OutlinedButton(
                        child: Text(locale.cancel),
                        onPressed: () => router.maybePop(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
