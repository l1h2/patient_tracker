import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '/config/routes/router.gr.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.theme,
    required this.router,
  });

  final ThemeData theme;
  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 26,
      icon: Container(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: theme.iconTheme.color!,
            width: 2,
          ),
        ),
        child: const Icon(Icons.person),
      ),
      onPressed: () => router.push(const SettingsMenuRoute()),
    );
  }
}
