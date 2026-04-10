import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../shared/accent_chip.dart';
import '../shared/gradient_card.dart';

class ChecklistCard extends StatelessWidget {
  const ChecklistCard({super.key});

  static const _pills = [
    'Ambientação do comércio',
    'Material de divulgação',
    'Brindes e relacionamento',
    'Operação de cadastro e ativação',
  ];

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Checklist de uso em campo', style: AppTypography.h3),
          const SizedBox(height: 4),
          Text(
            'Monte a rede credenciada com todos os materiais de PDV e apoio.',
            style: AppTypography.body.copyWith(color: AppColors.muted),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _pills.map((p) => AccentChip(text: p)).toList(),
          ),
          const SizedBox(height: 12),
          Text(
            'Dica: antes da visita, verifique estoque e logística dos itens.',
            style: AppTypography.bodySmall.copyWith(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}
