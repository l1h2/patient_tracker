import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:patient_tracker/src/core/models/records_model.dart';

import '../bloc/records_bloc.dart';

import '/config/locator/setup.dart';
import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/user_model.dart';
import '/src/core/repositories/user_repository.dart';
import '/src/features/patients/presentation/bloc/patients_bloc.dart';
import 'edit_patient_modal.dart';

class RecordsActionMenu extends StatefulWidget {
  const RecordsActionMenu({
    super.key,
    required this.locale,
    required this.user,
    required this.company,
    required this.patient,
    required this.records,
  });

  final AppLocalizations locale;
  final User user;
  final Company company;
  final Patient patient;
  final Records records;

  @override
  State<RecordsActionMenu> createState() => _RecordsActionMenuState();
}

class _RecordsActionMenuState extends State<RecordsActionMenu> {
  late Records _currentRecords;

  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _currentRecords = widget.records;
  }

  @override
  void didUpdateWidget(covariant RecordsActionMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.records != widget.records) {
      setState(() {
        _currentRecords = widget.records;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: _isMenuOpen ? const Icon(Icons.close) : const Icon(Icons.more_vert),
      onOpened: () => setState(() => _isMenuOpen = true),
      onCanceled: () => setState(() => _isMenuOpen = false),
      padding: const EdgeInsets.only(right: 10),
      offset: const Offset(-15, 40),
      onSelected: (String result) {
        switch (result) {
          case MenuOptions.editPatient:
            editPatientDialog(
              context: context,
              userId: widget.user.id,
              company: widget.company,
              patient: widget.patient,
            );
            setState(() => _isMenuOpen = false);
            break;
          case MenuOptions.deletePatient:
            deletePatientDialog(
              context: context,
              userId: widget.user.id,
              company: widget.company,
              patient: widget.patient,
            );
            setState(() => _isMenuOpen = false);
            break;
          case MenuOptions.deleteRecord:
            deleteRecordsDialog(
              context: context,
              company: widget.company,
              patient: widget.patient,
              records: widget.records,
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
              Text(_currentRecords.id ?? 'Null'),
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
              Text(widget.locale.deletePatient),
            ],
          ),
        ),
        if (widget.records.id != null) ...[
          const PopupMenuDivider(),
          PopupMenuItem(
            value: MenuOptions.deleteRecord,
            child: Row(
              children: [
                const Icon(Icons.delete),
                const SizedBox(width: 10),
                Text(widget.locale.deleteRecord),
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

void deletePatientDialog({
  required BuildContext context,
  required String userId,
  required Company company,
  required Patient patient,
}) {
  final AppLocalizations locale = AppLocalizations.of(context)!;
  final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(locale.deletePatient),
        content: Text(
          locale.deletionConfirmation(locale.patient.toLowerCase()),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 46,
                width: 120,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(locale.cancel),
                ),
              ),
              SizedBox(
                height: 46,
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    patientsBloc.add(DeletePatient(userId, company, patient));
                    Navigator.of(context).pop();
                  },
                  child: Text(locale.delete),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void deleteRecordsDialog({
  required BuildContext context,
  required Company company,
  required Patient patient,
  required Records records,
}) {
  final AppLocalizations locale = AppLocalizations.of(context)!;

  final User user = locator<UserRepository>().getUser()!;
  final RecordsBloc recordsBloc = BlocProvider.of<RecordsBloc>(context);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(locale.deleteRecord),
        content: Text(
          locale.deletionConfirmation(locale.record.toLowerCase()),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 46,
                width: 120,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(locale.cancel),
                ),
              ),
              SizedBox(
                height: 46,
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    recordsBloc.add(DeleteRecords(
                      user: user,
                      company: company,
                      patient: patient,
                      records: records,
                    ));
                    Navigator.of(context).pop();
                  },
                  child: Text(locale.delete),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
