abstract class LocalPreferencesInterface{
  Future<bool> getBool({String key, bool defaultValue=false});
  Future<bool> setBool({String key, bool value});

  Future<String> getString({String key, String defaultValue=""});
  Future<String> setString({String key, String value});

  Future<void> clearAll();
}