import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.router,
    required this.route,
    required this.text,
    required this.theme,
  });

  final StackRouter router;
  final PageRouteInfo route;
  final String text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => router.push(route),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 12, 0, 10),
        child: Row(
          children: [
            Expanded(
              child: Text(text, style: theme.textTheme.bodyLarge),
            ),
            const Icon(Icons.arrow_forward_ios, size: 22),
          ],
        ),
      ),
    );
  }
}
