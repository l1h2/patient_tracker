import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/patients_bloc.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/repositories/user_repository.dart';
import '/src/core/validators/not_empty_validator.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/scrollable_scaffold.dart';

@RoutePage()
class AddPatientScreen extends StatelessWidget {
  AddPatientScreen({super.key, required this.company});

  final Company company;

  final _patientNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String _userId = locator<UserRepository>().getUser()!.id;

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
          patientsBloc.add(GetPatients(_userId, company));
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
            appBar: SliverAppBar(title: Text(locale.addPatient)),
            content: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _patientNameController,
                      decoration: InputDecoration(hintText: locale.patientName),
                      style: theme.textTheme.labelMedium,
                      validator: (value) => notEmptyValidator(
                        value,
                        locale.patientName,
                        locale,
                      ),
                    ),
                    const SizedBox(height: 42),
                    ElevatedButton(
                      child: Text(locale.add),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          patientsBloc.add(
                            AddPatient(
                              _patientNameController.text,
                              _userId,
                              company.id,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      child: Text(locale.cancel),
                      onPressed: () => router.maybePop(),
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
