import 'package:flutter/material.dart';

/// Cores inspiradas no shadcn/ui
/// Documentação: https://ui.shadcn.com/themes
class AppColors {
  AppColors._();

  // ===== Light Mode =====

  // Background
  static const Color background = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFF0A0A0A);

  // Card
  static const Color card = Color(0xFFFFFFFF);
  static const Color cardForeground = Color(0xFF0A0A0A);

  // Popover
  static const Color popover = Color(0xFFFFFFFF);
  static const Color popoverForeground = Color(0xFF0A0A0A);

  // Primary
  static const Color primary = Color.fromARGB(255, 50, 104, 232);
  static const Color primaryForeground = Color(0xFFFAFAFA);

  // Secondary
  static const Color secondary = Color(0xFFF4F4F5);
  static const Color secondaryForeground = Color(0xFF0A0A0A);

  // Muted
  static const Color muted = Color(0xFFF4F4F5);
  static const Color mutedForeground = Color(0xFF71717A);

  // Accent
  static const Color accent = Color(0xFFF4F4F5);
  static const Color accentForeground = Color(0xFF0A0A0A);

  // Destructive
  static const Color destructive = Color(0xFFEF4444);
  static const Color destructiveForeground = Color(0xFFFAFAFA);

  // Border
  static const Color border = Color(0xFFE4E4E7);
  static const Color input = Color(0xFFE4E4E7);
  static const Color ring = Color(0xFF0A0A0A);

  // Chart colors
  static const Color chart1 = Color(0xFFE76E50);
  static const Color chart2 = Color(0xFF2A9D8F);
  static const Color chart3 = Color(0xFFE9C46A);
  static const Color chart4 = Color(0xFFF4A261);
  static const Color chart5 = Color(0xFF264653);

  // ===== Dark Mode =====

  // Background
  static const Color backgroundDark = Color(0xFF0A0A0A);
  static const Color foregroundDark = Color(0xFFFAFAFA);

  // Card
  static const Color cardDark = Color(0xFF0A0A0A);
  static const Color cardForegroundDark = Color(0xFFFAFAFA);

  // Popover
  static const Color popoverDark = Color(0xFF0A0A0A);
  static const Color popoverForegroundDark = Color(0xFFFAFAFA);

  // Primary
  static const Color primaryDark = Color(0xFFFAFAFA);
  static const Color primaryForegroundDark = Color(0xFF0A0A0A);

  // Secondary
  static const Color secondaryDark = Color(0xFF27272A);
  static const Color secondaryForegroundDark = Color(0xFFFAFAFA);

  // Muted
  static const Color mutedDark = Color(0xFF27272A);
  static const Color mutedForegroundDark = Color(0xFFA1A1AA);

  // Accent
  static const Color accentDark = Color(0xFF27272A);
  static const Color accentForegroundDark = Color(0xFFFAFAFA);

  // Destructive
  static const Color destructiveDark = Color(0xFF7F1D1D);
  static const Color destructiveForegroundDark = Color(0xFFFAFAFA);

  // Border
  static const Color borderDark = Color(0xFF27272A);
  static const Color inputDark = Color(0xFF27272A);
  static const Color ringDark = Color(0xFFD4D4D8);

  // Chart colors (same for dark mode)
  static const Color chart1Dark = Color(0xFFE76E50);
  static const Color chart2Dark = Color(0xFF2A9D8F);
  static const Color chart3Dark = Color(0xFFE9C46A);
  static const Color chart4Dark = Color(0xFFF4A261);
  static const Color chart5Dark = Color(0xFF264653);
}
