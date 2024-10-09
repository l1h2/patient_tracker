import 'package:flutter/material.dart';

import 'base_theme.dart';

/// Represents a dark theme for the application.
///
/// This class provides a dark theme for the application, which is based on the
/// [BaseTheme] class. The theme uses dark colors for the primary, secondary, and
/// tertiary colors, and provides alternative colors for the background, surface,
/// and text.
class DarkThemeColors implements ThemeColors {
  @override
  Brightness get brightness => Brightness.dark;
  @override
  Color get primary => Colors.black;
  @override
  Color get secondary => const Color(0xFFFFA200);
  @override
  Color get tertiary => const Color(0xFF727272);
  @override
  Color get inversePrimary => Colors.white;
  @override
  Color get background => const Color(0xFF595959);
  @override
  Color get textAlternative => const Color(0xFF727272);
  @override
  Color get switchOff => const Color(0xFF555555);
  @override
  ColorScheme get colorScheme => ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        tertiary: tertiary,
        inversePrimary: inversePrimary,
        onPrimaryContainer: const Color(0xFF27282A),
        error: const Color(0xFFF2B8B5),
        onError: const Color(0xFFC94D46),
        errorContainer: const Color(0xFF870000),
        onErrorContainer: Colors.white,
      );
}
