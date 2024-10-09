import 'package:flutter/material.dart';

class OnboardingAppBar extends SliverAppBar {
  OnboardingAppBar({
    super.key,
    required String title,
    required ThemeData theme,
  }) : super(
          title: Text(title.toUpperCase(), style: theme.textTheme.labelLarge),
          floating: true,
        );
}

class MainAppBar extends SliverAppBar {
  MainAppBar({
    super.key,
    required String title,
    required Widget actionButton,
  }) : super(
          toolbarHeight: 70,
          floating: true,
          title: Text(title),
          actions: [actionButton],
        );
}
