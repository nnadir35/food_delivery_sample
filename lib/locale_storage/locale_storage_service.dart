import '../enum/preference_keys.dart';

abstract class ILocaleStorageService {
  getData(PreferencesKeys preferenceKey);
  insertData(PreferencesKeys preferenceKey, List<String> value);
  clear(PreferencesKeys preferenceKey);
}
