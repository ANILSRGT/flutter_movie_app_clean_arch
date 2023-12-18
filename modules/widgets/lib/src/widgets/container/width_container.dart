import 'package:flutter/material.dart';

/// [WidthContainer] is a container that has a width constraint
/// [maxWidth] is default to 600
/// [minWidth] is default to 0
/// [isCenter] is default to true
final class WidthContainer extends StatelessWidget {
  /// [WidthContainer] constructor
  const WidthContainer({
    required this.child,
    this.maxWidth = 600.0,
    this.minWidth = 0.0,
    this.intrinsicHeight = true,
    this.height,
    this.isCenter,
    this.padding,
    this.margin,
    this.decoration,
    super.key,
  });

  /// [maxWidth] is the maximum width of the container
  /// default to 600
  final double maxWidth;

  /// [minWidth] is the minimum width of the container
  /// default to 0
  final double minWidth;

  /// [height] is the height of the container
  final double? height;

  /// Container will be centered if [isCenter] is true
  final bool? isCenter;

  /// [child] is the child of the container
  final Widget child;

  /// [padding] is the padding of the container
  final EdgeInsetsGeometry? padding;

  /// [margin] is the margin of the container
  final EdgeInsetsGeometry? margin;

  /// [decoration] is the decoration of the container
  final BoxDecoration? decoration;

  /// [intrinsicHeight] is the intrinsic height of the container
  final bool intrinsicHeight;

  @override
  Widget build(BuildContext context) {
    return intrinsicHeight
        ? IntrinsicHeight(child: _buildContainer())
        : _buildContainer();
  }

  Container _buildContainer() {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      transformAlignment:
          (isCenter ?? true) ? Alignment.center : AlignmentDirectional.topStart,
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        minWidth: minWidth,
      ),
      decoration: decoration,
      child: child,
    );
  }
}
