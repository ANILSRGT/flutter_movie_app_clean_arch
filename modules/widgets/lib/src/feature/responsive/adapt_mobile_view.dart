import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widgets/src/feature/responsive/custom_responsive_breakpoints.dart';

/// Make a adaptive view for mobile and tablet
final class AdaptMobileView extends StatelessWidget {
  /// Define the adaptive view only for mobile and tablet
  /// [phone], [tablet]
  const AdaptMobileView({
    required this.phone,
    required this.tablet,
    super.key,
  });

  /// The widget to display on phone
  final Widget phone;

  /// The widget to display on tablet
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.phone.name)) return phone;
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.tablet.name)) return tablet;

    return phone;
  }
}
