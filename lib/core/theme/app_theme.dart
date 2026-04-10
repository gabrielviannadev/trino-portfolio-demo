import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        canvasColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accentStrong,
          surface: AppColors.card,
          error: Color(0xFFFF6B6B),
        ),
        textTheme: TextTheme(
          headlineLarge: AppTypography.h1,
          headlineMedium: AppTypography.h2,
          headlineSmall: AppTypography.h3,
          bodyLarge: AppTypography.body,
          bodyMedium: AppTypography.bodySmall,
          labelLarge: AppTypography.badge,
          labelMedium: AppTypography.chip,
        ),
        dividerColor: AppColors.border,
        cardColor: AppColors.card,
        dialogTheme: const DialogThemeData(
          backgroundColor: AppColors.card,
        ),
      );
}
