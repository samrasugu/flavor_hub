import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // primary font (Sans-Serif)
  static const String primaryFont = 'Roboto';

  // secondary font (Serif)
  static const String secondaryFont = 'Lora';

  // headers (Bold, Sans-Serif)
  static const TextStyle header1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textCharcoal,
    letterSpacing: -0.5,
  );

  static const TextStyle header2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textCharcoal,
    letterSpacing: -0.25,
  );

  static const TextStyle header3 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textCharcoal,
    letterSpacing: 0,
  );

  // body (Regular, Sans-Serif)
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textCharcoal,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textCharcoal,
    height: 1.4,
  );

  // recipe (Serif for readability)
  static const TextStyle recipeDescription = TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textCharcoal,
    height: 1.6,
  );

  static const TextStyle recipeInstructions = TextStyle(
    fontFamily: secondaryFont,
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.textCharcoal,
    height: 1.7,
  );

  // caption and small text
  static const TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textMediumGray,
    letterSpacing: 0.4,
  );

  // button text
  static const TextStyle buttonText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );

  // navigation text
  static const TextStyle navigationText = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryBrown,
  );
}
