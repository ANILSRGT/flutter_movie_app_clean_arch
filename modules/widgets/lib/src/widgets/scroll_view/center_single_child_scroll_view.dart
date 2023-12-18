import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// [CenterSingleChildScrollView] is a widget that centers its child and
final class CenterSingleChildScrollView extends StatelessWidget {
  /// [CenterSingleChildScrollView] constructor
  const CenterSingleChildScrollView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  });

  /// [scrollDirection] is the axis along which the scroll view scrolls.
  final Axis scrollDirection;

  /// [reverse] is whether the scroll view scrolls in the reading direction.
  final bool reverse;

  /// [padding] is the amount of space by which to inset the child.
  final EdgeInsetsGeometry? padding;

  /// [primary] is whether this is the primary scroll view
  /// associated with the parent [PrimaryScrollController].
  final bool? primary;

  /// [physics] is the type of [ScrollPhysics] to use.
  final ScrollPhysics? physics;

  /// [controller] is the [ScrollController] to use for
  /// controlling the scroll position.
  final ScrollController? controller;

  /// [child] is the widget below this widget in the tree.
  final Widget? child;

  /// [dragStartBehavior] is the strategy to use when the user
  final DragStartBehavior dragStartBehavior;

  /// [clipBehavior] is how to clip the contents of the scroll view.
  final Clip clipBehavior;

  /// [restorationId] is the restoration ID to save and restore
  final String? restorationId;

  /// [keyboardDismissBehavior] is the strategy to use for dismissing
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        padding: padding,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        restorationId: restorationId,
        keyboardDismissBehavior: keyboardDismissBehavior,
        child: child,
      ),
    );
  }
}
