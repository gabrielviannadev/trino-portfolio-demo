import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class AccentBadge extends StatelessWidget {
  final String text;

  const AccentBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accentSurface,
        border: Border.all(color: AppColors.accentBorder),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: AppTypography.badge),
    );
  }
}
