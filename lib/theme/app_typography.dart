import 'package:flutter/material.dart';
import 'package:sigmus/theme/app_colors.dart';

/// Tipografia inspirada no shadcn/ui
class AppTypography {
  AppTypography._();

  // Font family - usando a system font do Flutter
  static const String fontFamily = 'GeistSans';
  static const String fontFamilyMono = 'GeistMono';

  // ===== Light Mode Typography =====

  static TextTheme textTheme = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.025,
      height: 1.0,
      color: AppColors.foreground,
    ),
    displayMedium: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.025,
      height: 1.0,
      color: AppColors.foreground,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.025,
      height: 1.0,
      color: AppColors.foreground,
    ),

    // Headline styles
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.025,
      height: 1.1,
      color: AppColors.foreground,
    ),
    headlineMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.025,
      height: 1.2,
      color: AppColors.foreground,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.025,
      height: 1.2,
      color: AppColors.foreground,
    ),

    // Title styles
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.015,
      height: 1.3,
      color: AppColors.foreground,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.015,
      height: 1.4,
      color: AppColors.foreground,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.01,
      height: 1.4,
      color: AppColors.foreground,
    ),

    // Body styles
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.foreground,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.foreground,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.mutedForeground,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: AppColors.foreground,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: AppColors.foreground,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.4,
      letterSpacing: 0.5,
      color: AppColors.mutedForeground,
    ),
  );

  // ===== Dark Mode Typography =====

  static TextTheme textThemeDark = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.025,
      height: 1.0,
      color: AppColors.foregroundDark,
    ),
    displayMedium: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.025,
      height: 1.0,
      color: AppColors.foregroundDark,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.025,
      height: 1.0,
      color: AppColors.foregroundDark,
    ),

    // Headline styles
    headlineLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.025,
      height: 1.1,
      color: AppColors.foregroundDark,
    ),
    headlineMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.025,
      height: 1.2,
      color: AppColors.foregroundDark,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.025,
      height: 1.2,
      color: AppColors.foregroundDark,
    ),

    // Title styles
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.015,
      height: 1.3,
      color: AppColors.foregroundDark,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.015,
      height: 1.4,
      color: AppColors.foregroundDark,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.01,
      height: 1.4,
      color: AppColors.foregroundDark,
    ),

    // Body styles
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.foregroundDark,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.foregroundDark,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.mutedForegroundDark,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: AppColors.foregroundDark,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
      color: AppColors.foregroundDark,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.4,
      letterSpacing: 0.5,
      color: AppColors.mutedForegroundDark,
    ),
  );
}
