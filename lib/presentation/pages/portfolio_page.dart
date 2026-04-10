import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../cubits/portfolio/portfolio_cubit.dart';
import '../cubits/portfolio/portfolio_state.dart';
import '../widgets/shared/firebase_banner.dart';
import '../widgets/shared/fade_slide_in.dart';
import '../widgets/header/portfolio_header.dart';
import '../widgets/hero/hero_section.dart';
import '../widgets/items/items_section.dart';
import '../widgets/kits/kits_section.dart';
import '../widgets/disclaimer/disclaimer_section.dart';
import '../widgets/footer/portfolio_footer.dart';

class ShimmerBlock extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBlock({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 12,
  });

  @override
  State<ShimmerBlock> createState() => _ShimmerBlockState();
}

class _ShimmerBlockState extends State<ShimmerBlock>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1.0 + 2.0 * _controller.value, 0),
              end: Alignment(-1.0 + 2.0 * _controller.value + 1, 0),
              colors: const [
                Color(0xFF0F1620),
                Color(0xFF1A2535),
                Color(0xFF0F1620),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PortfolioLoadingSkeleton extends StatelessWidget {
  const PortfolioLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerBlock(width: 140, height: 44),
                  ShimmerBlock(width: 160, height: 32, borderRadius: 999),
                ],
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBlock(width: 220, height: 32, borderRadius: 999),
                        const SizedBox(height: 16),
                        ShimmerBlock(height: 48),
                        const SizedBox(height: 12),
                        ShimmerBlock(height: 60),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(child: ShimmerBlock(height: 200)),
                ],
              ),
              const SizedBox(height: 48),
              ShimmerBlock(width: 200, height: 32),
              const SizedBox(height: 18),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                childAspectRatio: 0.72,
                children: List.generate(6, (_) => ShimmerBlock(height: 300)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: switch (state) {
              PortfolioInitial() || PortfolioLoading() =>
                const PortfolioLoadingSkeleton(key: ValueKey('loading')),
              PortfolioLoaded() => _LoadedContent(
                  key: const ValueKey('loaded'),
                  state: state,
                ),
              PortfolioError() => _ErrorContent(
                  key: const ValueKey('error'),
                  message: state.message,
                ),
            },
          );
        },
      ),
    );
  }
}

class _LoadedContent extends StatefulWidget {
  final PortfolioLoaded state;

  const _LoadedContent({super.key, required this.state});

  @override
  State<_LoadedContent> createState() => _LoadedContentState();
}

class _LoadedContentState extends State<_LoadedContent> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrolled = _scrollController.offset > 80;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.6, -0.8),
                  radius: 1.2,
                  colors: [
                    AppColors.accent.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.3],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.8, -1.0),
                  radius: 1.2,
                  colors: [
                    AppColors.accent.withValues(alpha: 0.06),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.3],
                ),
              ),
            ),
          ),
        ),

        Column(
          children: [
            const FirebaseBanner(),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 80),
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 100),
                          child: const HeroSection(),
                        ),
                        const SizedBox(height: 48),
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 300),
                          child: ItemsSection(items: widget.state.items),
                        ),
                        const SizedBox(height: 48),
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 500),
                          child: KitsSection(
                            kits: widget.state.kits,
                            allItems: widget.state.items,
                          ),
                        ),
                        const SizedBox(height: 48),
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 600),
                          child: const DisclaimerSection(),
                        ),
                        const SizedBox(height: 50),
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 700),
                          child: PortfolioFooter(data: widget.state.footerData),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedSlide(
                      offset: Offset(0, _isScrolled ? 0 : -0.3),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      child: AnimatedOpacity(
                        opacity: _isScrolled ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: ClipRRect(
                          child: PortfolioHeader(isCollapsed: true),
                        ),
                      ),
                    ),
                  ),

                  if (!_isScrolled)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: PortfolioHeader(isCollapsed: false),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ErrorContent extends StatelessWidget {
  final String message;

  const _ErrorContent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: AppColors.accent.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text('Ops! Algo deu errado.', style: AppTypography.h2),
            const SizedBox(height: 8),
            Text(message, style: AppTypography.body, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.read<PortfolioCubit>().loadPortfolio(),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Tentar novamente'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentSurface,
                foregroundColor: AppColors.accent,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: AppColors.accentBorder),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
