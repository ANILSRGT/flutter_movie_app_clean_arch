/// Future extensions for [Future] with `void` return type
extension FutureExtensions on Future<void> {
  /// [delayWithMs] delays the execution of the future
  /// for the given [ms] milliseconds
  Future<void> delayWithMs(int ms) async {
    await Future.delayed(Duration(milliseconds: ms), () {});
  }
}
