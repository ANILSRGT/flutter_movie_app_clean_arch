import 'package:flutter/material.dart';

/// Stateful mixin to handle loading status
mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  /// Get loading status
  bool get isLoading => _isLoadingNotifier.value;

  /// Get loading status notifier
  ValueNotifier<bool> get isLoadingNotifier => _isLoadingNotifier;

  /// Change loading status
  void changeLoading({bool? isLoading}) {
    if (isLoading != null) {
      _isLoadingNotifier.value = isLoading;
      return;
    }

    _isLoadingNotifier.value = !_isLoadingNotifier.value;
  }
}
