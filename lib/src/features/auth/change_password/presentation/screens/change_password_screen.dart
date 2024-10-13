import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/password_bloc.dart';

import '/src/core/validators/not_empty_validator.dart';
import '/src/core/validators/password_validator.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final PasswordBloc passwordBloc = BlocProvider.of<PasswordBloc>(context);

    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is PasswordChangeSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                locale.passwordChanged,
                textAlign: TextAlign.center,
              ),
            ),
          );
          router.maybePop();
        } else if (state is InvalidCredentials) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            locale.invalidPassword,
            theme,
          );
        } else if (state is PasswordChangeFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is PasswordChangeLoading,
          child: ScrollableScaffold(
            appBar: MainAppBar(title: locale.changePassword),
            content: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      locale.changePasswordText,
                      style: theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _currentPasswordController,
                      decoration: InputDecoration(
                        hintText: locale.currentPassword,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: "●",
                      validator: (value) => notEmptyValidator(
                        value,
                        locale.password,
                        locale,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        hintText: locale.newPassword,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: "●",
                      validator: (value) => newPasswordValidator(
                        value,
                        _currentPasswordController.text,
                        locale,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: locale.confirmPassword,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: "●",
                      validator: (value) => confirmPasswordValidator(
                        value,
                        _newPasswordController.text,
                        locale,
                      ),
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      height: 56,
                      width: screenSize.width * 0.8,
                      child: FilledButton(
                        child: Text(locale.changePasswordAction),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            passwordBloc.add(
                              PasswordChange(
                                currentPassword:
                                    _currentPasswordController.text,
                                newPassword: _newPasswordController.text,
                              ),
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
