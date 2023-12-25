import 'package:core/src/managers/cache_manager/ICache.dart';

/// Interface for cache managers
abstract class ICacheManager<T extends ICache> {
  ///[ICacheManager] constructor
  /// [cache] cache instance based on [ICache]
  ICacheManager(T cache) : _cache = cache;

  final T _cache;

  /// Initialize cache
  Future<void> init() => _cache.init();

  /// Clear cache
  Future<void> clear() => _cache.clear();

  /// Delete cache
  Future<void> delete(String key) => _cache.delete(key);

  /// Write cache
  Future<void> writeString(String key, String value) =>
      _cache.writeString(key, value);

  /// Read cache
  Future<String?> readString<T2>(String key) => _cache.readString(key);
}
