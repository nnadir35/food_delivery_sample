import '../locale_storage/locale_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enum/preference_keys.dart';

class LocalStorageManager extends ILocaleStorageService {
  PreferencesKeys _preferenceKey;
  LocalStorageManager(PreferencesKeys key) {
    _preferenceKey = key;
  }
  static LocalStorageManager _instance;
  LocalStorageManager._();
  static LocalStorageManager get instance =>
      _instance ??= LocalStorageManager._();

  SharedPreferences _preferences;
  initSharedPref() async =>
      _preferences = await SharedPreferences.getInstance();

  @override
  insertData(PreferencesKeys preferenceKey, List<String> value) async {
    await _preferences.setStringList(preferenceKey.toString(), value);
  }

  Future<bool> clear(PreferencesKeys preferenceKey) async {
    _preferences = await SharedPreferences.getInstance();
    return await _preferences.remove(preferenceKey.toString()) ?? false;
  }

  @override
  Future<List<String>> getData(PreferencesKeys preferenceKey) async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getStringList(preferenceKey.toString()) ?? [];
  }
}
