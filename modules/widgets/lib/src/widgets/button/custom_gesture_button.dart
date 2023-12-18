import 'package:flutter/material.dart';

/// [CustomGestureButton] is the custom elevated button of the application.
final class CustomGestureButton extends StatefulWidget {
  /// [CustomGestureButton] constructor
  const CustomGestureButton({
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.mainAxisSize = MainAxisSize.max,
    this.loadingWidget,
  });

  /// [leftIcon] is the left icon of the button
  final Widget? leftIcon;

  /// [child] is the child of the button
  final Widget child;

  /// [rightIcon] is the right icon of the button
  final Widget? rightIcon;

  /// [onPressed] is the callback of the button
  final VoidCallback? onPressed;

  /// [mainAxisSize] is the main axis size of the button
  final MainAxisSize mainAxisSize;

  /// [isLoading] is the loading state of the button
  final bool isLoading;

  /// [loadingWidget] is the loading widget of the button
  /// default is [CircularProgressIndicator] (*adaptive)
  final Widget? loadingWidget;

  @override
  State<CustomGestureButton> createState() => _CustomGestureButtonState();
}

class _CustomGestureButtonState extends State<CustomGestureButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? (widget.loadingWidget ??
            const Center(child: CircularProgressIndicator.adaptive()))
        : GestureDetector(
            onTap: widget.onPressed,
            child: Row(
              mainAxisSize: widget.mainAxisSize,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.leftIcon != null) widget.leftIcon!,
                if (widget.leftIcon != null) const SizedBox(width: 8),
                widget.child,
                if (widget.rightIcon != null) const SizedBox(width: 8),
                if (widget.rightIcon != null) widget.rightIcon!,
              ],
            ),
          );
  }
}
