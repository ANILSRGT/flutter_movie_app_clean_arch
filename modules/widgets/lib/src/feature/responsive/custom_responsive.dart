import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widgets/src/feature/responsive/custom_responsive_breakpoints.dart';

/// Custom responsive for project
/// [MOBILE] 0 - 450
/// [TABLET] 451 - 800
/// [DESKTOP] 801 - 1920
/// [4K] 1921 - double.infinity
/// [CustomRepsonsive.build(context, child)]
final class CustomResponsive {
  /// Make to ui responsive
  static Widget build(BuildContext context, Widget? child) {
    final breakpoints = CustomResponsiveBreakpoints.values
        .map((e) => Breakpoint(start: e.start, end: e.end, name: e.name))
        .toList();
    return ResponsiveBreakpoints(
      breakpoints: breakpoints,
      child: child!,
    );
  }
}
