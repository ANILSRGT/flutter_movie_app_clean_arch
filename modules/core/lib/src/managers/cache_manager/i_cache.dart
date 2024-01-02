/// Interface for caches
abstract class ICache {
  /// Initialize cache
  Future<void> init();

  /// Clear cache
  Future<void> clear();

  /// Delete cache
  /// Returns true if successful and false if not
  Future<bool> delete(String key);

  /// Write cache
  /// Returns true if successful and false if not
  Future<bool> writeString(String key, String value);

  /// Read cache
  Future<String?> readString(String key);
}
