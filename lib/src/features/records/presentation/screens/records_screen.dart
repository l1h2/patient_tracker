import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/records_bloc.dart';
import '../widgets/action_menu.dart';
import '../widgets/calendar.dart';
import '../widgets/form/records_form.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/records_model.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';
import '/src/features/patients/presentation/bloc/patients_bloc.dart' as pb;

@RoutePage()
class RecordsScreen extends StatelessWidget {
  RecordsScreen({
    super.key,
    required this.company,
    required this.patient,
    required this.currentRecords,
  });

  final Company company;
  final Patient patient;
  final Records currentRecords;

  final User _user = locator<UserRepository>().getUser()!;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final RecordsBloc recordsBloc = BlocProvider.of<RecordsBloc>(context);

    return BlocConsumer<RecordsBloc, RecordsState>(
      listener: (context, state) {
        if (state is RecordsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(locale.recordSaved, textAlign: TextAlign.center),
            ),
          );
        } else if (state is DeleteRecordsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(locale.recordsDeleted, textAlign: TextAlign.center),
            ),
          );
        } else if (state is NoChangesToSave) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            locale.noChanges,
            theme,
          );
        } else if (state is EmptyRecords) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            locale.emptyForm,
            theme,
          );
        } else if (state is RecordsFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        if (state is GetRecordsSuccess) currentRecords.update(state.records);

        return BlocConsumer<pb.PatientsBloc, pb.PatientsState>(
          listener: (context, patientsState) {
            if (patientsState is pb.DeletePatientSuccess) router.maybePop();
          },
          builder: (context, patientsState) {
            return ModalProgressHUD(
              inAsyncCall: patientsState is pb.SearchingPatients ||
                  state is RecordsLoading,
              child: ScrollableScaffold(
                appBar: MainAppBar(
                  title: patient.name,
                  actionButton: RecordsActionMenu(
                    locale: locale,
                    user: _user,
                    company: company,
                    patient: patient,
                    records: currentRecords,
                  ),
                ),
                content: Column(
                  children: [
                    DatePicker(
                      currentDate: currentRecords.date,
                      recordsBloc: recordsBloc,
                      user: _user,
                      company: company,
                      patient: patient,
                    ),
                    RecordsForm(
                      locale: locale,
                      recordsBloc: recordsBloc,
                      user: _user,
                      company: company,
                      patient: patient,
                      records: currentRecords,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
