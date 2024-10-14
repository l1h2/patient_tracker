import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/patients_bloc.dart';

import '/src/core/widgets/deletion_dialog.dart';
import '/src/features/home/presentation/bloc/home_bloc.dart';
import 'edit_company_modal.dart';

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
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    final PatientsBloc patientsBloc = BlocProvider.of<PatientsBloc>(context);

    return PopupMenuButton(
      icon: _isMenuOpen ? const Icon(Icons.close) : const Icon(Icons.more_vert),
      onOpened: () => setState(() => _isMenuOpen = true),
      onCanceled: () => setState(() => _isMenuOpen = false),
      padding: const EdgeInsets.only(right: 10),
      offset: const Offset(-15, 40),
      onSelected: (String result) {
        switch (result) {
          case MenuOptions.editCompany:
            editCompanyDialog(context: context);
            setState(() => _isMenuOpen = false);
            break;
          case MenuOptions.deleteCompany:
            deleteDocumentDialog(
              context: context,
              docName: locale.patient,
              onDelete: () => homeBloc.add(
                DeleteCompany(patientsBloc.companyId),
              ),
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
              Text(locale.editCompany),
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
              Text(locale.deleteCompany),
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
