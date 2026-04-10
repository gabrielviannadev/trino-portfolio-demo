import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  MediaQueryData get mq => MediaQuery.of(this);
  double get screenWidth => mq.size.width;
  bool get isMobile => screenWidth < 768;
  bool get isTablet => screenWidth >= 768 && screenWidth < 1100;
  bool get isDesktop => screenWidth >= 1100;
}
