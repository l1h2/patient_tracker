import 'package:flutter/material.dart';

class OnboardingAppBar extends SliverAppBar {
  OnboardingAppBar({
    super.key,
    required String title,
  }) : super(
          title: Text(title.toUpperCase()),
          centerTitle: true,
          floating: true,
        );
}

class MainAppBar extends SliverAppBar {
  MainAppBar({
    super.key,
    required String title,
    Widget? actionButton,
  }) : super(
          toolbarHeight: 70,
          floating: true,
          title: Text(title),
          centerTitle: true,
          actions: [if (actionButton != null) actionButton],
        );
}
