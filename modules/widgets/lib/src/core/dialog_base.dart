import 'package:flutter/material.dart';

/// A base class for dialogs.
final class DialogBase {
  DialogBase._();

  /// Show a dialog
  /// barrierDismissible: false
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: builder,
    );
  }
}
