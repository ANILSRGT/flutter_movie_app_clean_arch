import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widgets/src/feature/responsive/custom_responsive_breakpoints.dart';

/// Make a adaptive view for all platforms
final class AdaptAllView extends StatelessWidget {
  /// Define the adaptive view for all platforms
  /// [phone], [tablet], [desktop], [fourK]
  /// <br><br>If the current platform is not defined,
  /// other platforms are used sequentially.
  /// <br>[fourK] ?? [desktop] ?? [tablet] ?? [phone] ?? [defaultWidget]
  const AdaptAllView({
    required this.defaultWidget,
    this.phone,
    this.tablet,
    this.desktop,
    this.fourK,
    super.key,
  });

  /// The widget to display on default
  final Widget defaultWidget;

  /// The widget to display on phone
  final Widget? phone;

  /// The widget to display on tablet
  final Widget? tablet;

  /// The widget to display on desktop
  final Widget? desktop;

  /// The widget to display on 4K
  final Widget? fourK;

  /// Get the widget to display on the current platform
  /// [phone], [tablet], [desktop], [fourK].
  /// <br><br>If the current platform is not defined,
  /// other platforms are used sequentially.
  /// <br>[fourK] ?? [desktop] ?? [tablet] ?? *[phone]
  static T withT<T>({
    required BuildContext context,
    required T defaultWidget,
    T? phone,
    T? tablet,
    T? desktop,
    T? fourK,
  }) {
    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.fourK.name)) {
      return fourK ?? desktop ?? tablet ?? phone ?? defaultWidget;
    }

    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.desktop.name)) {
      return desktop ?? tablet ?? phone ?? defaultWidget;
    }

    if (ResponsiveBreakpoints.of(context)
        .equals(CustomResponsiveBreakpoints.tablet.name)) {
      return tablet ?? phone ?? defaultWidget;
    }

    return phone ?? defaultWidget;
  }

  @override
  Widget build(BuildContext context) {
    return withT<Widget>(
      context: context,
      defaultWidget: defaultWidget,
      phone: phone,
      tablet: tablet,
      desktop: desktop,
      fourK: fourK,
    );
  }
}
