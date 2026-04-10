import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imagePaths;
  final String itemName;

  const ImageCarousel({
    super.key,
    required this.imagePaths,
    required this.itemName,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    key: ValueKey(widget.imagePaths[index]),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      widget.imagePaths[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => _PlaceholderImage(
                        name: widget.itemName,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (widget.imagePaths.length > 1) ...[
          const SizedBox(height: 12),
          _CarouselIndicators(
            count: widget.imagePaths.length,
            currentIndex: _currentPage,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ],
    );
  }
}

class _CarouselIndicators extends StatelessWidget {
  final int count;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _CarouselIndicators({
    required this.count,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return GestureDetector(
          onTap: () => onTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? AppColors.accent : AppColors.border,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}

class _PlaceholderImage extends StatelessWidget {
  final String name;

  const _PlaceholderImage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: Center(
        child: Text(name, style: AppTypography.h3),
      ),
    );
  }
}
