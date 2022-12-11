import 'package:food_delivery_test/locale_storage/locale_storage_service.dart';
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
  insertData(List<String> value) async {
    await _preferences.setStringList(_preferenceKey.toString(), value);
  }

  Future<bool> clear() async {
    return _preferences.remove(_preferenceKey.toString());
  }

  @override
  getData() {
    return _preferences.getStringList(_preferenceKey.toString());
  }
}
