import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/records_bloc.dart';
import '../widgets/action_menu.dart';
import '../widgets/calendar.dart';
import '../widgets/form/records_form.dart';

import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';
import '/src/core/widgets/selection_checkbox.dart';
import '/src/features/patients/presentation/bloc/patients_bloc.dart' as pb;

@RoutePage()
class RecordsScreen extends StatelessWidget {
  RecordsScreen({
    super.key,
    required this.companyId,
    required this.patientId,
    required this.date,
  });

  final String companyId;
  final String patientId;
  final DateTime date;

  final _initController = BoolController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final RecordsBloc recordsBloc = BlocProvider.of<RecordsBloc>(context);
    final pb.PatientsBloc patientsBloc =
        BlocProvider.of<pb.PatientsBloc>(context);

    if (!_initController.boolean) {
      recordsBloc.init(companyId: companyId, patientId: patientId, date: date);
      _initController.boolean = true;
    }

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
        return BlocConsumer<pb.PatientsBloc, pb.PatientsState>(
          listener: (context, patientsState) {
            if (patientsState is pb.DeletePatientSuccess) router.maybePop();
          },
          builder: (context, patientsState) {
            return ModalProgressHUD(
              inAsyncCall: patientsState is pb.SearchingPatients ||
                  patientsState is pb.GettingRecords ||
                  state is RecordsLoading,
              child: RefreshIndicator(
                onRefresh: () async => patientsBloc.add(
                  pb.GetRecords(
                    patientId: recordsBloc.patientId,
                    date: recordsBloc.currentRecords.date,
                    pushRecordsRoute: false,
                  ),
                ),
                child: ScrollableScaffold(
                  appBar: MainAppBar(
                    title: recordsBloc.patient?.name ?? '',
                    actionButton: const RecordsActionMenu(),
                  ),
                  content: Column(
                    children: [
                      DatePicker(locale: locale, recordsBloc: recordsBloc),
                      RecordsForm(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
