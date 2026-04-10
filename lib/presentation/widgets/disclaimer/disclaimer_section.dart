import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/responsive.dart';
import '../shared/gradient_card.dart';

class DisclaimerSection extends StatelessWidget {
  const DisclaimerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.constrainedContent(
      child: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
          child: GradientCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Disclaimer', style: AppTypography.h3),
                const SizedBox(height: 8),
                Text(
                  'Os tablets para consulta de transações (PDV) são distribuídos em '
                  'comodato em período de testes e não devem ser distribuídos amplamente. '
                  'A entrega está condicionada à ausência física do gestor na loja.',
                  style: AppTypography.body,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
