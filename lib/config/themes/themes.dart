import 'package:flutter/material.dart';

import 'base_theme.dart';
import 'dark_theme.dart';

/// The dark theme for the application.
BaseTheme getDarkTheme(Size screenSize) {
  return BaseTheme(
    colors: DarkThemeColors(),
    screenSize: screenSize,
  );
}
