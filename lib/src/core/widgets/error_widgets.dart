import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.text,
    required this.theme,
  });

  final String text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: theme.textTheme.headlineSmall?.copyWith(
        color: theme.colorScheme.error,
      ),
    );
  }
}

class ErrorScaffoldMessenger {
  const ErrorScaffoldMessenger(this.context);

  final BuildContext context;

  factory ErrorScaffoldMessenger.of(BuildContext context) {
    return ErrorScaffoldMessenger(context);
  }

  void showSnackBar(String text, ThemeData theme) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onErrorContainer,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: theme.colorScheme.errorContainer,
      ),
    );
  }
}
