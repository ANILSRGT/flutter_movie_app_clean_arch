import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Stateful mixin to check if the widget is mounted
mixin MountedMixin<T extends StatefulWidget> on State<T> {
  /// Check if the widget is mounted
  Future<void> safeCall(AsyncCallback callback) async {
    if (!mounted) return;
    await callback.call();
  }
}
