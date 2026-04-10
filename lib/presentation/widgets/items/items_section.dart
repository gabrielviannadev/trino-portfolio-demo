import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/utils/responsive.dart';
import '../../../domain/entities/portfolio_item.dart';
import '../shared/accent_chip.dart';
import 'portfolio_item_card.dart';
import 'item_detail_modal.dart';

class ItemsSection extends StatelessWidget {
  final List<PortfolioItem> items;

  const ItemsSection({super.key, required this.items});

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
              Text('Itens disponíveis', style: AppTypography.h2),
              const SizedBox(height: 8),
              Text(
                'Lista completa do kit de implantação Trino.',
                style: AppTypography.body,
              ),
              const SizedBox(height: 8),
              const AccentChip(text: 'Clique para abrir a galeria de fotos'),
              const SizedBox(height: 18),
              _buildGrid(context, columns),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildGrid(BuildContext context, int columns) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: columns == 1 ? 0.75 : 0.58,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return PortfolioItemCard(
          item: item,
          onTap: () => ItemDetailModal.show(context, item),
        );
      },
    );
  }
}
