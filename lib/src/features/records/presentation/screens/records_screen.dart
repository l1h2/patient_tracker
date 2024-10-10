import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:patient_tracker/config/locator/setup.dart';
import 'package:patient_tracker/src/core/models/records_model.dart';
import 'package:patient_tracker/src/core/repositories/user_repository.dart';
import 'package:patient_tracker/src/core/widgets/main_app_bar.dart';
import 'package:patient_tracker/src/core/widgets/scrollable_scaffold.dart';
import 'package:patient_tracker/src/features/patients/presentation/bloc/patients_bloc.dart';

import '../widgets/calendar.dart';
import '../widgets/edit_name_modal.dart';

import '/src/core/models/company_model.dart';
import '/src/core/models/patient_model.dart';

@RoutePage()
class RecordsScreen extends StatelessWidget {
  RecordsScreen({
    super.key,
    required Company company,
    required Patient patient,
  })  : _records = locator<UserRepository>().getRecordsList(company, patient),
        _patient = locator<UserRepository>().getPatient(company, patient.id)!,
        _company = locator<UserRepository>().getCompany(company.id)!;

  final Company _company;
  final Patient _patient;
  final List<Records> _records;

  final String _userId = locator<UserRepository>().getUser()!.id;
  final _editNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsBloc, PatientsState>(
      builder: (context, patientsState) {
        return ModalProgressHUD(
          inAsyncCall: patientsState is SearchingPatients,
          child: ScrollableScaffold(
            appBar: MainAppBar(
              title: _patient.name,
              actionButton: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => editNameDialog(
                  context: context,
                  userId: _userId,
                  company: _company,
                  patient: _patient,
                  controller: _editNameController,
                ),
              ),
            ),
            content: Column(
              children: [
                DatePicker(records: _patient.records),
              ],
            ),
          ),
        );
      },
    );
  }
}
