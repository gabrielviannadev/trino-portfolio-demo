import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class GradientCard extends StatelessWidget {
  final Widget child;

  const GradientCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x08FFFFFF), Color(0x03FFFFFF)],
        ),
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
