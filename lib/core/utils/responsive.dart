import 'package:flutter/material.dart';

abstract final class Responsive {
  static const double maxContentWidth = 1100;
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1100;

  static int gridColumns(double width) {
    if (width >= tabletBreakpoint) return 3;
    if (width >= mobileBreakpoint) return 2;
    return 1;
  }

  static EdgeInsets contentPadding(double width) {
    if (width >= tabletBreakpoint) return EdgeInsets.zero;
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  static Widget constrainedContent({
    required Widget child,
    double maxWidth = maxContentWidth,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
