import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/records_bloc.dart';
import '../widgets/calendar.dart';
import '../widgets/edit_patient_modal.dart';
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
class RecordsScreen extends StatefulWidget {
  const RecordsScreen({
    super.key,
    required this.company,
    required this.patient,
    required this.currentRecords,
  });

  final Company company;
  final Patient patient;
  final Records currentRecords;

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  late User _user;
  late Company _company;
  late Patient _patient;
  late Records _currentRecords;

  @override
  void initState() {
    super.initState();
    _user = locator<UserRepository>().getUser()!;
    _company = _user.companies[widget.company.id]!;
    _patient = _company.patients[widget.patient.id]!;
    _currentRecords = widget.currentRecords;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final RecordsBloc recordsBloc = BlocProvider.of<RecordsBloc>(context);

    return BlocListener<RecordsBloc, RecordsState>(
      listener: (context, state) {
        if (state is RecordsSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(locale.recordSaved, textAlign: TextAlign.center),
            ),
          );
        } else if (state is GetRecordsSuccess) {
          setState(() => _currentRecords.update(state.records));
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
      child: BlocBuilder<pb.PatientsBloc, pb.PatientsState>(
        builder: (context, patientsState) {
          return ModalProgressHUD(
            inAsyncCall: patientsState is pb.SearchingPatients,
            child: ScrollableScaffold(
              appBar: MainAppBar(
                title: _patient.name,
                actionButton: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => editPatientDialog(
                    context: context,
                    userId: _user.id,
                    company: _company,
                    patient: _patient,
                  ),
                ),
              ),
              content: Column(
                children: [
                  DatePicker(
                    currentDate: _currentRecords.date,
                    recordsBloc: recordsBloc,
                    user: _user,
                    company: _company,
                    patient: _patient,
                  ),
                  RecordsForm(
                    locale: locale,
                    recordsBloc: recordsBloc,
                    user: _user,
                    company: _company,
                    patient: _patient,
                    records: _currentRecords,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
