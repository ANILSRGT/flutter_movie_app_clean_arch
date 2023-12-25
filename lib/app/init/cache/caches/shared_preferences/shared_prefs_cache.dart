import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared preferences cache
final class SharedPrefsCache extends ICache {
  late final SharedPreferences? _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void _checkInit() {
    if (_prefs == null) throw Exception('SharedPrefsCache not initialized');
  }

  @override
  Future<void> clear() async {
    _checkInit();
    await _prefs?.clear();
  }

  @override
  Future<bool> delete(String key) async {
    _checkInit();
    return _prefs?.remove(key) ?? Future.value(false);
  }

  @override
  Future<String?> readString(String key) async {
    _checkInit();
    return _prefs?.getString(key);
  }

  @override
  Future<bool> writeString(String key, String value) {
    _checkInit();
    return _prefs?.setString(key, value) ?? Future.value(false);
  }
}
