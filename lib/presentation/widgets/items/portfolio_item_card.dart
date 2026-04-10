import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/portfolio_item.dart';
import '../shared/accent_chip.dart';

class PortfolioItemCard extends StatefulWidget {
  final PortfolioItem item;
  final VoidCallback onTap;

  const PortfolioItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<PortfolioItemCard> createState() => _PortfolioItemCardState();
}

class _PortfolioItemCardState extends State<PortfolioItemCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x05FFFFFF), Color(0x03FFFFFF)],
            ),
            border: Border.all(
              color: _isHovered ? AppColors.borderHover : AppColors.border,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.accent.withValues(alpha: 0.08)
                    : AppColors.shadow,
                blurRadius: _isHovered ? 30 : 60,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: _Thumbnail(item: widget.item)),
              const SizedBox(height: 12),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.item.quantity != null) ...[
                      AccentChip(text: 'Qtd: ${widget.item.quantity}'),
                      const SizedBox(height: 6),
                    ],
                    Text(
                      widget.item.name,
                      style: AppTypography.h3,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.item.description != null) ...[
                      const SizedBox(height: 4),
                      Flexible(
                        child: Text(
                          widget.item.description!,
                          style: AppTypography.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final PortfolioItem item;

  const _Thumbnail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x1F2DE477), Color(0x0AFFFFFF)],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: item.hasPhotos
          ? Image.asset(
              item.images.first,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) => _PlaceholderContent(),
            )
          : _PlaceholderContent(),
    );
  }
}

class _PlaceholderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x142DE477), Color(0x08FFFFFF)],
        ),
      ),
      child: Center(
        child: Text(
          'FOTO EM BREVE',
          style: TextStyle(
            color: AppColors.muted,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
