import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/records_bloc.dart';

import '/src/core/widgets/deletion_dialog.dart';
import '/src/features/patients/presentation/bloc/patients_bloc.dart';
import 'edit_patient_modal.dart';

class RecordsActionMenu extends StatefulWidget {
  const RecordsActionMenu({super.key});

  @override
  State<RecordsActionMenu> createState() => _RecordsActionMenuState();
}

class _RecordsActionMenuState extends State<RecordsActionMenu> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);
    final RecordsBloc recordsBloc = BlocProvider.of<RecordsBloc>(context);

    return PopupMenuButton(
      icon: _isMenuOpen ? const Icon(Icons.close) : const Icon(Icons.more_vert),
      onOpened: () => setState(() => _isMenuOpen = true),
      onCanceled: () => setState(() => _isMenuOpen = false),
      padding: const EdgeInsets.only(right: 10),
      offset: const Offset(-15, 40),
      onSelected: (String result) {
        switch (result) {
          case MenuOptions.editPatient:
            editPatientDialog(context: context);
            setState(() => _isMenuOpen = false);
            break;
          case MenuOptions.deletePatient:
            deleteDocumentDialog(
              context: context,
              docName: locale.patient,
              onDelete: () => patientsBloc.add(
                DeletePatient(recordsBloc.patientId),
              ),
            );
            setState(() => _isMenuOpen = false);
            break;
          case MenuOptions.deleteRecord:
            deleteDocumentDialog(
              context: context,
              docName: locale.record,
              onDelete: () => recordsBloc.add(DeleteRecords()),
            );
            setState(() => _isMenuOpen = false);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: MenuOptions.editPatient,
          child: Row(
            children: [
              const Icon(Icons.edit),
              const SizedBox(width: 10),
              Text(locale.editPatient),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: MenuOptions.deletePatient,
          child: Row(
            children: [
              const Icon(Icons.delete),
              const SizedBox(width: 10),
              Text(locale.deletePatient),
            ],
          ),
        ),
        if (recordsBloc.currentRecords.id != null) ...[
          const PopupMenuDivider(),
          PopupMenuItem(
            value: MenuOptions.deleteRecord,
            child: Row(
              children: [
                const Icon(Icons.delete),
                const SizedBox(width: 10),
                Text(locale.deleteRecord),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class MenuOptions {
  static const editPatient = 'editPatient';
  static const deletePatient = 'deletePatient';
  static const deleteRecord = 'deleteRecord';
}
