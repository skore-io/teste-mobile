import 'package:score_cursos/app/common/preferences/local_preferences_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalPreferences implements LocalPreferencesInterface{

  SharedPreferences? _prefs;

  loadInstance()async{
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> getBool({String? key, bool defaultValue = false})async {
    await loadInstance();
    return _prefs?.getBool(key!) ?? defaultValue;
  }

  @override
  Future<String> getString({String? key, String defaultValue = ""})async {
    await loadInstance();
    return _prefs?.getString(key!) ?? defaultValue;
  }

  @override
  Future<bool> setBool({String? key, bool? value})async {
    await loadInstance();
    _prefs?.setBool(key!, value!);
    return value!;
  }

  @override
  Future<String> setString({String? key, String? value})async {
    await loadInstance();
    await _prefs?.setString(key!, value!);
    return value!;
  }

  @override
  Future<void> clearAll()async {
    await loadInstance();
    _prefs?.clear();
  }

}