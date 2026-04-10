import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class AccentChip extends StatelessWidget {
  final String text;
  final bool isAccent;

  const AccentChip({super.key, required this.text, this.isAccent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isAccent ? AppColors.accentSurface : Colors.white.withValues(alpha: 0.04),
        border: Border.all(
          color: isAccent ? AppColors.accentBorder : AppColors.border,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: isAccent
            ? AppTypography.chip.copyWith(color: AppColors.accent)
            : AppTypography.chip,
      ),
    );
  }
}
