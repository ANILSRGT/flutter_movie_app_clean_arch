import 'package:core/core.dart';

/// Cache manager
final class CacheManager<T extends ICache> extends ICacheManager<T> {
  /// [CacheManager] constructor
  CacheManager(super.cache);
}
