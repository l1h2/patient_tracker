import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.router,
    required this.route,
    required this.text,
    required this.theme,
    this.brandText,
  });

  final StackRouter router;
  final PageRouteInfo route;
  final String text;
  final ThemeData theme;
  final bool? brandText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => router.push(route),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: (brandText ?? false)
                    ? theme.textTheme.titleMedium
                    : theme.textTheme.bodyLarge,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: theme.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
