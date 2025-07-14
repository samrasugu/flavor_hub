import 'package:flutter/material.dart';

class AppColors {
  // primary colors
  static const Color primaryOrange = Color(0xFFFF6B35);
  static const Color secondaryBrown = Color(0xFF8B4513);
  static const Color accentGreen = Color(0xFF4CAF50);

  // neutral colors
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color textCharcoal = Color(0xFF2C2C2C);
  static const Color textMediumGray = Color(0xFF757575);
  static const Color borderLightGray = Color(0xFFE0E0E0);

  // additional colors for UI elements
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFFA726);
  static const Color success = accentGreen;
  static const Color info = Color(0xFF1976D2);

  // surface colors
  static const Color surface = backgroundWhite;
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color onSurface = textCharcoal;
  static const Color onSurfaceVariant = textMediumGray;

  // shadow colors
  static const Color shadow = Color(0x1A000000);
  static const Color lightShadow = Color(0x0D000000);
}
