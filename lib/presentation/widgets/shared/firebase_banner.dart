import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class FirebaseBanner extends StatefulWidget {
  const FirebaseBanner({super.key});

  @override
  State<FirebaseBanner> createState() => _FirebaseBannerState();
}

class _FirebaseBannerState extends State<FirebaseBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
        final shift = _controller.value * 2.0;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0 + shift, 0),
              end: Alignment(0.0 + shift, 0),
              colors: const [
                AppColors.bannerEnd,
                AppColors.bannerStart,
                Color(0xFFFFAB40),
                AppColors.bannerStart,
                AppColors.bannerEnd,
              ],
              stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
          child: child,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.local_fire_department_rounded,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              'Este projeto está hospedado no Firebase e foi desenvolvido por Gabriel Vianna. '
              'Todos os créditos e direitos de marca pertencem à Trino Pagamentos LTDA.',
              style: AppTypography.banner,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
