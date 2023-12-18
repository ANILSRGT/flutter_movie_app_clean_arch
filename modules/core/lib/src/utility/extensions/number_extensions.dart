/// Number extensions for [num]
extension NumberExtensions on num {
  /// [waitMS] delays the execution of the future for the milliseconds
  Future<void> get waitMS async {
    await Future.delayed(Duration(milliseconds: toInt()), () {});
  }
}
