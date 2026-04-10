import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/footer_link.dart';

class PortfolioFooter extends StatelessWidget {
  final FooterData data;

  const PortfolioFooter({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.footerBackground,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 768;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    isMobile
                        ? _buildMobileTop(context)
                        : _buildDesktopTop(context),
                    const SizedBox(height: 40),
                    Text(
                      data.legalText,
                      style: AppTypography.footerSmall.copyWith(
                        color: AppColors.footerText.withValues(alpha: 0.8),
                        height: 1.6,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ),
                    const SizedBox(height: 40),
                    Container(height: 1, color: const Color(0xFF0F172A)),
                    const SizedBox(height: 40),
                    isMobile ? _buildMobileBottom() : _buildDesktopBottom(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopTop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.logoBranco, height: 40),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.navigationLinks
              .map(
                (link) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _FooterLinkButton(link: link),
                ),
              )
              .toList(),
        ),
        const SizedBox(width: 60),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.complianceLinks
              .map(
                (link) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _FooterLinkButton(link: link),
                ),
              )
              .toList(),
        ),
        const Spacer(),
        Row(
          children: data.socialLinks
              .map(
                (link) => Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: _SocialIcon(link: link),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildMobileTop(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppAssets.logoBranco, height: 36),
        const SizedBox(height: 32),
        ...data.navigationLinks.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _FooterLinkButton(link: link, centered: true),
          ),
        ),
        const SizedBox(height: 16),
        ...data.complianceLinks.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _FooterLinkButton(link: link, centered: true),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.socialLinks
              .map(
                (link) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _SocialIcon(link: link),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildDesktopBottom() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(data.copyright, style: AppTypography.footerBody),
        ),
        Expanded(
          flex: 2,
          child: Text(
            data.cnpj,
            style: AppTypography.footerBody,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Tel: ${data.phone}\nE-mail: ${data.email}',
            style: AppTypography.footerBody,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          flex: 4,
          child: Text(
            data.address,
            style: AppTypography.footerBody,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileBottom() {
    return Column(
      children: [
        Text(
          data.copyright,
          style: AppTypography.footerBody,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          data.cnpj,
          style: AppTypography.footerBody,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          'Tel: ${data.phone}\nE-mail: ${data.email}',
          style: AppTypography.footerBody,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          data.address,
          style: AppTypography.footerBody,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _FooterLinkButton extends StatefulWidget {
  final FooterLink link;
  final bool centered;

  const _FooterLinkButton({required this.link, this.centered = false});

  @override
  State<_FooterLinkButton> createState() => _FooterLinkButtonState();
}

class _FooterLinkButtonState extends State<_FooterLinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => debugPrint('Navigate to: ${widget.link.url}'),
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          alignment: widget.centered ? Alignment.center : Alignment.centerLeft,
          child: Text(
            widget.link.label,
            style: widget.link.isThin
                ? AppTypography.footerLinkThin
                : AppTypography.footerLink,
            textAlign: widget.centered ? TextAlign.center : TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final FooterLink link;

  const _SocialIcon({required this.link});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  FaIconData get _icon {
    final label = widget.link.label.toLowerCase();
    if (label.contains('instagram')) return FontAwesomeIcons.instagram;
    if (label.contains('linkedin')) return FontAwesomeIcons.linkedinIn;
    if (label.contains('youtube')) return FontAwesomeIcons.youtube;
    return FontAwesomeIcons.link;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => debugPrint('Navigate to: ${widget.link.url}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.15)
                : Colors.transparent,
          ),
          child: FaIcon(_icon, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
