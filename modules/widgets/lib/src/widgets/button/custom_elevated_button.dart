import 'package:flutter/material.dart';

/// [CustomElevatedButton] is the custom elevated button of the application.
final class CustomElevatedButton extends StatefulWidget {
  /// [CustomElevatedButton] constructor
  const CustomElevatedButton({
    required this.child,
    required this.onPressed,
    this.isLoading = false,
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.mainAxisSize = MainAxisSize.max,
    this.loadingWidget,
    this.bgColor,
    this.fgColor,
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

  /// [bgColor] is the background color of the button
  final Color? bgColor;

  /// [fgColor] is the foreground color of the button
  final Color? fgColor;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isLoading ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: widget.fgColor,
        backgroundColor: widget.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
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
