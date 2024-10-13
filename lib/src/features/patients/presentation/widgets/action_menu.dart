import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/user_model.dart';
import 'edit_company_modal.dart';

class RecordsActionMenu extends StatefulWidget {
  const RecordsActionMenu({
    super.key,
    required this.locale,
    required this.user,
    required this.company,
  });

  final AppLocalizations locale;
  final User user;
  final Company company;

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
          case MenuOptions.editCompany:
            editCompanyDialog(
              context: context,
              userId: widget.user.id,
              company: widget.company,
            );
            setState(() => _isMenuOpen = false);
            break;
          case MenuOptions.deleteCompany:
            deleteCompanyDialog(
              context: context,
              userId: widget.user.id,
              company: widget.company,
            );
            setState(() => _isMenuOpen = false);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: MenuOptions.editCompany,
          child: Row(
            children: [
              const Icon(Icons.edit),
              const SizedBox(width: 10),
              Text(widget.locale.editCompany),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: MenuOptions.deleteCompany,
          child: Row(
            children: [
              const Icon(Icons.delete),
              const SizedBox(width: 10),
              Text(widget.locale.deleteCompany),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuOptions {
  static const editCompany = 'editCompany';
  static const deleteCompany = 'deleteCompany';
}

void deleteCompanyDialog({
  required BuildContext context,
  required String userId,
  required Company company,
}) {
  final AppLocalizations locale = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(locale.deleteCompany),
        content: Text(
          locale.deletionConfirmation(locale.company.toLowerCase()),
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
