import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';

class PortfolioHeader extends StatelessWidget {
  final bool isCollapsed;

  const PortfolioHeader({super.key, this.isCollapsed = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsets.symmetric(
        vertical: isCollapsed ? 10 : 16,
      ),
      decoration: BoxDecoration(
        color: isCollapsed
            ? AppColors.background.withValues(alpha: 0.92)
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isCollapsed ? AppColors.border : Colors.transparent,
          ),
        ),
      ),
      child: Responsive.constrainedContent(
        child: LayoutBuilder(builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppAssets.logoVerde,
                      height: isCollapsed ? 32 : (isMobile ? 38 : 44),
                    ),
                  ),
                ),
                AnimatedScale(
                  scale: isCollapsed ? 0.9 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'Portfólio de Materiais',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
