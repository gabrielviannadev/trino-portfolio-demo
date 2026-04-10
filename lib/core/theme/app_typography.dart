import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTypography {
  static TextStyle get _base => GoogleFonts.inter(color: AppColors.text);

  static TextStyle get h1 => _base.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        height: 1.1,
      );

  static TextStyle get h2 => _base.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h3 => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  static TextStyle get body => _base.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.muted,
        height: 1.6,
      );

  static TextStyle get bodySmall => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.muted,
        height: 1.5,
      );

  static TextStyle get badge => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.accent,
      );

  static TextStyle get chip => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.muted,
      );

  static TextStyle get eyebrow => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.muted,
        letterSpacing: 0.4,
      );

  static TextStyle get brand => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.2,
      );

  static TextStyle get footerLink => GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );

  static TextStyle get footerLinkThin => GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      );

  static TextStyle get footerBody => GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.footerText,
      );

  static TextStyle get footerSmall => GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.footerText,
      );

  static TextStyle get banner => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
}
