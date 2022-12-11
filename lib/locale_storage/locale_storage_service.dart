import '../enum/preference_keys.dart';

abstract class ILocaleStorageService {
  getData();
  insertData(List<String> value);
  clear();
}
