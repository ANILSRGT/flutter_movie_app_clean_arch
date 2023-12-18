import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widgets/src/feature/responsive/custom_responsive_breakpoints.dart';

/// Make a adaptive view for all platforms
final class AdaptAllView extends StatelessWidget {
  /// Define the adaptive view for all platforms
  /// [phone], [tablet], [desktop], [fourK]
  const AdaptAllView({
    required this.phone,
    required this.tablet,
    required this.desktop,
    required this.fourK,
    super.key,
  });

  /// The widget to display on phone
  final Widget phone;

  /// The widget to display on tablet
  final Widget tablet;

  /// The widget to display on desktop
  final Widget desktop;

  /// The widget to display on 4K
  final Widget fourK;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.phone.name)) return phone;
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.tablet.name)) return tablet;
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.desktop.name)) return desktop;
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.fourK.name)) return fourK;

    return phone;
  }
}
