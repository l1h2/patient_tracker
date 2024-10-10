import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/forgot_password_bloc.dart';

import '/src/core/validators/email_validator.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final ForgotPasswordBloc forgotPasswordBloc =
        BlocProvider.of<ForgotPasswordBloc>(context);

    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ResetLinkSent) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                locale.sentLink(state.email),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state is ResetPasswordFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgotPasswordLoading,
          child: ScrollableScaffold(
            appBar: OnboardingAppBar(title: locale.passwordRecovery),
            content: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      locale.passwordRecoveryText,
                      style: theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 52),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: locale.email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value, locale),
                    ),
                    const SizedBox(height: 42),
                    OutlinedButton(
                      child: Text(locale.resetPassword),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          forgotPasswordBloc.add(
                            SendResetLink(_emailController.text),
                          );
                        }
                      },
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
