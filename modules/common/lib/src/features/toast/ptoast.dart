import 'package:flutter/material.dart';

/// Toast type
// ignore: public_member_api_docs
enum PToastType { success, error, warning, info }

/// Toast position
// ignore: public_member_api_docs
enum PToastPosition { top, bottom, center }

/// Toast duration
enum PToastDuration {
  /// 500ms
  low(Duration(milliseconds: 500)),

  /// 1000ms
  normal(Duration(milliseconds: 1000)),

  /// 1500ms
  high(Duration(milliseconds: 1500)),

  /// 2000ms
  veryHigh(Duration(milliseconds: 2000));

  const PToastDuration(this.value);

  /// Duration of the toast
  final Duration value;
}

/// Toast interface
abstract class PToast {
  /// Build toast widget
  NavigatorObserver get observer;

  /// Build toast widget
  Widget build(BuildContext context, Widget? child);

  /// Default background color
  static Color defaultBackgroundColor(PToastType type) {
    switch (type) {
      case PToastType.success:
        return Colors.greenAccent;
      case PToastType.error:
        return Colors.red;
      case PToastType.warning:
        return Colors.orange;
      case PToastType.info:
        return Colors.blue;
    }
  }

  /// Default foreground color
  static Color defaultForegroundColor(PToastType type) {
    switch (type) {
      case PToastType.success:
        return Colors.black;
      case PToastType.error:
        return Colors.white;
      case PToastType.warning:
        return Colors.white;
      case PToastType.info:
        return Colors.white;
    }
  }

  /// Show toast
  void showText({
    required String text,
    PToastType type = PToastType.info,
    PToastPosition position = PToastPosition.bottom,
    PToastDuration duration = PToastDuration.normal,
    ToasterStateBuilder backgroundColor = defaultBackgroundColor,
    ToasterStateBuilder foregroundColor = defaultForegroundColor,
    TextStyle? textStyle,
    VoidCallback? onClose,
    bool cancelPrevious = true,
  });

  /// Cancel toast
  void cancel();
}

/// Toast state builder
typedef ToasterStateBuilder = Color Function(PToastType type);
