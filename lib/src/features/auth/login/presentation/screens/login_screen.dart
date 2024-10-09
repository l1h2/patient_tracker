import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bloc/login_bloc.dart';

import '/config/routes/router.gr.dart';
import '/src/core/validators/email_validator.dart';
import '/src/core/validators/not_empty_validator.dart';
import '/src/core/widgets/error_widgets.dart';
import '/src/core/widgets/main_app_bar.dart';
import '/src/core/widgets/scrollable_scaffold.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    final Size screenSize = MediaQuery.of(context).size;
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          router.replaceAll([HomeRoute()]);
        } else if (state is LoginUserNotFound) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            locale.userNotFoundMessage,
            theme,
          );
        } else if (state is LoginFailure) {
          ErrorScaffoldMessenger.of(context).showSnackBar(
            state.error,
            theme,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: ScrollableScaffold(
            appBar: OnboardingAppBar(title: locale.login, theme: theme),
            content: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: locale.email),
                      style: theme.textTheme.labelMedium,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value, locale),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(hintText: locale.password),
                      style: theme.textTheme.labelMedium,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: "●",
                      validator: (value) => notEmptyValidator(
                        value,
                        locale.password,
                        locale,
                      ),
                    ),
                    if (state is LoginUserNotFound) ...[
                      const SizedBox(height: 10),
                      Text(
                        locale.invalidCredentials,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    TextButton(
                      child: Text(
                        locale.forgotPassword,
                        style: theme.textTheme.bodySmall,
                      ),
                      onPressed: () {
                        router.push(ForgotPasswordRoute());
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: Text(locale.loginAction),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          loginBloc.add(
                            LoginRequest(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
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
