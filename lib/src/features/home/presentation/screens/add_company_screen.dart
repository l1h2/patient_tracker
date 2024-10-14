import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/home_bloc.dart';

import '/src/core/validators/name_validator.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';

@RoutePage()
class AddCompanyScreen extends StatelessWidget {
  AddCompanyScreen({super.key});

  final _companyNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AddCompanySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                locale.addCompanySuccess,
                textAlign: TextAlign.center,
              ),
            ),
          );
          router.maybePop();
        } else if (state is AddCompanyFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is HomeLoading,
          child: ScrollableScaffold(
            appBar: MainAppBar(title: locale.addCompany),
            content: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _companyNameController,
                      decoration: InputDecoration(hintText: locale.companyName),
                      validator: (value) => nameValidator(
                        value,
                        locale,
                        locale.companyName,
                      ),
                    ),
                    const SizedBox(height: 42),
                    SizedBox(
                      height: 56,
                      width: screenSize.width * 0.8,
                      child: FilledButton(
                        child: Text(locale.add),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            homeBloc.add(
                              AddCompany(_companyNameController.text),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 56,
                      width: screenSize.width * 0.8,
                      child: OutlinedButton(
                        child: Text(locale.cancel),
                        onPressed: () => router.maybePop(),
                      ),
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
