import 'package:flutter/material.dart';
import 'package:samsat_gpt/core.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  static bool isMobile() => MediaQuery.of(globalContext).size.width < 850;

  static bool isTablet() =>
      MediaQuery.of(globalContext).size.width < 1100 &&
      MediaQuery.of(globalContext).size.width >= 850;

  static bool isDesktop() => MediaQuery.of(globalContext).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(globalContext).size;

    if (size.width >= 1100) {
      return desktop!;
    } else if (size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return mobile!;
    }
  }
}
