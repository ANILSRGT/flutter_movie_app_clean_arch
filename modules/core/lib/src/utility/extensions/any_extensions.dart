/// Extensions for all objects.
extension AnyExtensions on Object? {
  /// Returns the [value] if it is not null, otherwise returns null.
  T? nullOr<T>(T value) => this == null ? null : value;
}
