import 'package:flavor_hub/shared/themes/app_colors.dart';
import 'package:flavor_hub/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryOrange,
        secondary: AppColors.secondaryBrown,
        tertiary: AppColors.accentGreen,
        surface: AppColors.surface,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        error: AppColors.error,
        onError: Colors.white,
        outline: AppColors.borderLightGray,
      ),

      // typography
      textTheme: TextTheme(
        displayLarge: AppTextStyles.header1,
        displayMedium: AppTextStyles.header2,
        displaySmall: AppTextStyles.header3,
        headlineLarge: AppTextStyles.header1,
        headlineMedium: AppTextStyles.header2,
        headlineSmall: AppTextStyles.header3,
        titleLarge: AppTextStyles.header2,
        titleMedium: AppTextStyles.header3,
        titleSmall: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.caption,
        labelLarge: AppTextStyles.buttonText,
        labelMedium: AppTextStyles.navigationText,
        labelSmall: AppTextStyles.caption,
      ),

      // app bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundWhite,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.secondaryBrown,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.header2.copyWith(
          color: AppColors.secondaryBrown,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(
          color: AppColors.secondaryBrown,
          size: 24,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.secondaryBrown,
          size: 24,
        ),
      ),

      // bottom nav bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundWhite,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.textMediumGray,
        selectedLabelStyle: AppTextStyles.caption,
        unselectedLabelStyle: AppTextStyles.caption,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // drawer
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.backgroundWhite,
        surfaceTintColor: AppColors.surfaceVariant,
      ),

      // card
      cardTheme: CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.surfaceVariant,
        elevation: 2,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      // elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.buttonText,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
      ),

      // text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryOrange,
          textStyle: AppTextStyles.buttonText,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLightGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderLightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryOrange,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textMediumGray,
        ),
      ),

      // icon
      iconTheme: const IconThemeData(color: AppColors.secondaryBrown, size: 24),

      // divider
      dividerTheme: const DividerThemeData(
        color: AppColors.borderLightGray,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryOrange,
        secondary: AppColors.secondaryBrown,
        tertiary: AppColors.accentGreen,
        surface: Color(0xFF1E1E1E),
        surfaceContainerHighest: Color(0xFF2A2A2A),
        onSurface: Colors.white,
        onSurfaceVariant: Color(0xFFBDBDBD),
        error: AppColors.error,
        onError: Colors.white,
        outline: Color(0xFF444444),
      ),

      textTheme: TextTheme(
        displayLarge: AppTextStyles.header1.copyWith(color: Colors.white),
        displayMedium: AppTextStyles.header2.copyWith(color: Colors.white),
        displaySmall: AppTextStyles.header3.copyWith(color: Colors.white),
        headlineLarge: AppTextStyles.header1.copyWith(color: Colors.white),
        headlineMedium: AppTextStyles.header2.copyWith(color: Colors.white),
        headlineSmall: AppTextStyles.header3.copyWith(color: Colors.white),
        titleLarge: AppTextStyles.header2.copyWith(color: Colors.white),
        titleMedium: AppTextStyles.header3.copyWith(color: Colors.white),
        titleSmall: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
        bodySmall: AppTextStyles.caption.copyWith(color: Colors.white60),
        labelLarge: AppTextStyles.buttonText,
        labelMedium: AppTextStyles.navigationText,
        labelSmall: AppTextStyles.caption.copyWith(color: Colors.white60),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.white, size: 24),
        actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF121212),
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: AppTextStyles.caption,
        unselectedLabelStyle: AppTextStyles.caption,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFF121212),
        surfaceTintColor: Colors.transparent,
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.buttonText,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryOrange,
          textStyle: AppTextStyles.buttonText,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF444444)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF444444)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryOrange,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        hintStyle: AppTextStyles.bodyMedium.copyWith(color: Colors.white54),
      ),

      iconTheme: const IconThemeData(color: Colors.white, size: 24),

      dividerTheme: const DividerThemeData(
        color: Color(0xFF444444),
        thickness: 1,
        space: 1,
      ),
    );
  }
}
