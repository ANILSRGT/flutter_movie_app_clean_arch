/// Extensions for [Iterable].
extension IterableExtensions<T> on Iterable<T> {
  /// Returns a random element from the iterable.
  Iterable<T> takeRandom(int count) {
    final tempCount = count > length ? length : count;
    if (tempCount <= 0) return const Iterable.empty();
    final list = toList()..shuffle();
    return list.take(tempCount);
  }
}
