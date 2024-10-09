import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Implementations of this class should provide the getters for each color property.
abstract class ThemeColors {
  /// The brightness of the theme.
  Brightness get brightness;

  /// The primary color used in the theme.
  Color get primary;

  /// The secondary color used in the theme.
  Color get secondary;

  /// The tertiary color used in the theme.
  Color get tertiary;

  /// The inverse primary color used in the theme.
  Color get inversePrimary;

  /// The alternative background color used in the theme.
  Color get background;

  /// The alternative text color used in the theme.
  Color get textAlternative;

  /// The color used for switches when they are turned off.
  Color get switchOff;

  /// The color scheme used in the theme.
  ColorScheme get colorScheme;
}

/// Defines a base theme for the application.
///
/// This class provides a base theme for the application, which can be extended
/// to create custom themes. The theme is based on the provided [colors] and
/// [screenSize].
class BaseTheme {
  /// Creates a new base theme with the provided [colors] and [screenSize].
  BaseTheme({required this.colors, required this.screenSize});

  final ThemeColors colors;
  final Size screenSize;

  ThemeData get themeData {
    // Set the status bar style
    setStatusBarStyle();

    return ThemeData(
      // General theme settings
      brightness: colors.brightness,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.background,
      colorScheme: colors.colorScheme,

      // AppBar theme
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: colors.inversePrimary),
        backgroundColor: colors.background,
        titleTextStyle: TextStyle(
          color: colors.inversePrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),

      // Text themes
      textTheme: TextTheme(
        // Headlines
        headlineLarge: TextStyle(
          color: colors.inversePrimary,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: colors.inversePrimary,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: colors.inversePrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        // Display text
        displayLarge: TextStyle(
          color: colors.inversePrimary,
          fontSize: 46,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: colors.inversePrimary,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: colors.inversePrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),

        // Body text
        bodyLarge: TextStyle(color: colors.inversePrimary, fontSize: 16),
        bodyMedium: TextStyle(
          color: colors.inversePrimary,
          fontSize: 14,
          decorationColor: colors.inversePrimary,
        ),
        bodySmall: TextStyle(
          color: colors.inversePrimary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),

        // Labels and alternative text
        labelLarge: TextStyle(
          color: colors.inversePrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(color: colors.primary, fontSize: 14),
        labelSmall: TextStyle(
          color: colors.textAlternative,
          fontSize: 12,
          decorationColor: colors.textAlternative,
        ),

        // Used for brand text
        titleLarge: TextStyle(
          color: colors.secondary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: colors.secondary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: colors.secondary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.secondary,
          foregroundColor: colors.primary,
          alignment: Alignment.center,
          minimumSize: Size(screenSize.width * 0.8, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.inversePrimary,
          side: BorderSide(color: colors.inversePrimary, width: 1),
          alignment: Alignment.center,
          minimumSize: Size(screenSize.width * 0.8, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Input theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(18),
        fillColor: colors.inversePrimary,
        prefixIconColor: colors.secondary,
        suffixIconColor: colors.textAlternative,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colors.primary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colors.primary,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: colors.primary,
            width: 1,
          ),
        ),
        outlineBorder: BorderSide(
          color: colors.primary,
          width: 1,
        ),
        hintStyle: TextStyle(
          color: colors.textAlternative,
          fontSize: 14,
        ),
      ),
    );
  }

  void setStatusBarStyle() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: colors.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    ));
  }
}
