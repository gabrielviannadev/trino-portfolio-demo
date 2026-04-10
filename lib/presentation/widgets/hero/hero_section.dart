import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/responsive.dart';
import '../shared/accent_badge.dart';
import 'checklist_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.constrainedContent(
      child: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        final textColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccentBadge(text: 'Implantação e credenciamento'),
            const SizedBox(height: 16),
            Text('Portfólio de Materiais', style: AppTypography.h1),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Text(
                'Utilize esta página como referência rápida para treinar o time '
                'comercial e planejar a implantação do ecossistema Trino nos '
                'municípios. Cada item abaixo quando clicado exibe uma galeria '
                'quando houver mais de uma foto.',
                style: AppTypography.body,
              ),
            ),
          ],
        );

        if (isMobile) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChecklistCard(),
                const SizedBox(height: 24),
                textColumn,
              ],
            ),
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 11, child: textColumn),
            const SizedBox(width: 24),
            const Expanded(flex: 9, child: ChecklistCard()),
          ],
        );
      }),
    );
  }
}
