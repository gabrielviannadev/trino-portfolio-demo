import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/portfolio_item.dart';
import '../shared/accent_chip.dart';
import '../shared/image_carousel.dart';

class ItemDetailModal extends StatelessWidget {
  final PortfolioItem item;

  const ItemDetailModal({super.key, required this.item});

  static Future<void> show(BuildContext context, PortfolioItem item) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Fechar detalhe',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8 * animation.value,
            sigmaY: 8 * animation.value,
          ),
          child: FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          ),
        );
      },
      pageBuilder: (context, animation2, animation3) => Center(
        child: ItemDetailModal(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth > 800 ? 720.0 : screenWidth - 32;
    final images = item.hasPhotos ? item.images : <String>[];

    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Portfólio Trino', style: AppTypography.eyebrow),
                          const SizedBox(height: 4),
                          Text(item.name, style: AppTypography.h3),
                          if (item.description != null) ...[
                            const SizedBox(height: 4),
                            Text(item.description!, style: AppTypography.body),
                          ],
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              if (item.quantity != null)
                                AccentChip(text: 'Quantidade: ${item.quantity}'),
                              AccentChip(
                                text: item.hasPhotos ? 'Com foto' : 'Foto em breve',
                                isAccent: item.hasPhotos,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close_rounded, color: AppColors.muted),
                      tooltip: 'Fechar',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: images.isNotEmpty
                      ? ImageCarousel(imagePaths: images, itemName: item.name)
                      : AspectRatio(
                          aspectRatio: 4 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xFF1EC063), Color(0xFF182433)],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Foto em breve',
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
