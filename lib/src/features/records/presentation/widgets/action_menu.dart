import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';
import '/src/core/models/user_model.dart';
import 'edit_patient_modal.dart';

class RecordsActionMenu extends StatefulWidget {
  const RecordsActionMenu({
    super.key,
    required this.locale,
    required this.user,
    required this.company,
    required this.patient,
    this.recordsId,
  });

  final AppLocalizations locale;
  final User user;
  final Company company;
  final Patient patient;
  final String? recordsId;

  @override
  State<RecordsActionMenu> createState() => _RecordsActionMenuState();
}

class _RecordsActionMenuState extends State<RecordsActionMenu> {
  bool _isMenuOpen = false;

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
              userId: widget.user.id,
              company: widget.company,
              patient: widget.patient,
              recordsId: widget.recordsId!,
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
              Text(widget.locale.editPatient),
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
        const PopupMenuDivider(),
        if (widget.recordsId != null)
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
                    // Add your delete patient logic here
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
  required String userId,
  required Company company,
  required Patient patient,
  required String recordsId,
}) {
  final AppLocalizations locale = AppLocalizations.of(context)!;

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
                    // Add your delete record logic here
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
