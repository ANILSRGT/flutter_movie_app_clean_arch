import 'package:flutter/material.dart';

/// A widget that represents an avatar.
final class Avatar extends StatelessWidget {
  /// Creates an avatar.
  const Avatar({
    super.key,
    this.text,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.radius = 24.0,
  })  : assert(
          text != null || child != null,
          'Either text or child must be provided.',
        ),
        assert(
          radius >= 12,
          'The radius must be greater than or equal to 12.',
        );

  /// [radius] of the avatar.
  final double radius;

  /// [text] of the avatar.
  final String? text;

  /// [child] of the avatar.
  final Widget? child;

  /// [backgroundColor] of the avatar.
  final Color? backgroundColor;

  /// [foregroundColor] of the avatar.
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final radiusToTextStyle = radius < 18
        ? Theme.of(context).textTheme.titleSmall
        : radius < 24
            ? Theme.of(context).textTheme.titleMedium
            : Theme.of(context).textTheme.titleLarge;
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      child: child ??
          Text(
            text!,
            style: radiusToTextStyle?.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
