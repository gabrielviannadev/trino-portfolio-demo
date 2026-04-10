import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/responsive.dart';
import '../../../domain/entities/kit.dart';
import '../../../domain/entities/portfolio_item.dart';
import 'kit_card.dart';

class KitsSection extends StatelessWidget {
  final List<Kit> kits;
  final List<PortfolioItem> allItems;

  const KitsSection({super.key, required this.kits, required this.allItems});

  @override
  Widget build(BuildContext context) {
    return Responsive.constrainedContent(
      child: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final columns = Responsive.gridColumns(constraints.maxWidth);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kits por público', style: AppTypography.h2),
              const SizedBox(height: 8),
              Text(
                'Seleção de materiais distribuídos por perfil de público.',
                style: AppTypography.body,
              ),
              const SizedBox(height: 18),
              if (columns == 1)
                ...kits.map((kit) => Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: KitCard(kit: kit, allItems: allItems),
                    ))
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < kits.length; i++) ...[
                      if (i > 0) const SizedBox(width: 18),
                      Expanded(child: KitCard(kit: kits[i], allItems: allItems)),
                    ],
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
