import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/kit.dart';
import '../../../domain/entities/portfolio_item.dart';
import '../shared/gradient_card.dart';
import '../items/item_detail_modal.dart';

class KitCard extends StatelessWidget {
  final Kit kit;
  final List<PortfolioItem> allItems;

  const KitCard({super.key, required this.kit, required this.allItems});

  PortfolioItem? _findItem(String slug) {
    try {
      return allItems.firstWhere((item) => item.slug == slug);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(kit.title, style: AppTypography.h3),
          const SizedBox(height: 12),
          ...kit.entries.map((entry) => _KitEntryTile(
                entry: entry,
                onTap: entry.isClickable
                    ? () {
                        final item = _findItem(entry.itemSlug!);
                        if (item != null) ItemDetailModal.show(context, item);
                      }
                    : null,
              )),
        ],
      ),
    );
  }
}

class _KitEntryTile extends StatefulWidget {
  final KitEntry entry;
  final VoidCallback? onTap;

  const _KitEntryTile({required this.entry, this.onTap});

  @override
  State<_KitEntryTile> createState() => _KitEntryTileState();
}

class _KitEntryTileState extends State<_KitEntryTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          decoration: BoxDecoration(
            color: _isHovered && widget.onTap != null
                ? Colors.white.withValues(alpha: 0.03)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _buildThumbnail(),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.entry.label,
                  style: AppTypography.body.copyWith(
                    color: AppColors.muted,
                    fontSize: 14,
                  ),
                ),
              ),
              if (widget.onTap != null)
                Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: _isHovered
                      ? AppColors.accent
                      : AppColors.muted.withValues(alpha: 0.5),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    if (widget.entry.thumbnailPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          widget.entry.thumbnailPath!,
          width: 30,
          height: 30,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _placeholderThumb(),
        ),
      );
    }
    return _placeholderThumb();
  }

  Widget _placeholderThumb() {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0x2E2DE477), Color(0x0DFFFFFF)],
        ),
      ),
    );
  }
}
