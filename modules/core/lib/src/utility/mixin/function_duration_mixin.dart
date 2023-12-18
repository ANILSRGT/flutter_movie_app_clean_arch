import 'package:flutter/foundation.dart';

/// [FunctionDurationMixin] is an async function timer
mixin FunctionDurationMixin {
  /// [waitOperation] waits for the [callback] to finish
  /// <br>Returns the duration of the [callback]
  Future<int> waitOperation(AsyncCallback callback) async {
    final stopwatch = Stopwatch()..start();
    await callback();
    stopwatch.stop();
    return stopwatch.elapsedMilliseconds;
  }
}
