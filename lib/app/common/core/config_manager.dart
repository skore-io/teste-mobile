import 'package:score_cursos/app/common/preferences/local_preferences_interface.dart';
import 'package:score_cursos/app/common/utils/constants.dart';

class ConfigManager{

  final LocalPreferencesInterface _localPreferences;
  ConfigManager(this._localPreferences);

  bool firstAccess = false;
  String accessToken = "";

  Future<bool?> initialize()async{
    try{
      await loadConfigFromLocalPreferences();
      return true;
    }catch(_){
      return false;
    }
  }

  Future? loadConfigFromLocalPreferences()async{
    firstAccess = await _getFirstAccessFromLocalPreferences;
    accessToken = await _getAccessTokenFromLocalPreferences;
  }

  Future<bool> get _getFirstAccessFromLocalPreferences async => await _localPreferences.getBool(key: firstAcessKey);
  setHasFirstAccess(bool value) async => firstAccess = await _localPreferences.setBool(key: firstAcessKey, value: value);

  // TODO TOKEN STATICO PAR AO APP ENTENDER QUE EXISTE UM USUARIO LOGADO AFIM DE TESTAR
  Future<String> get _getAccessTokenFromLocalPreferences async => await _localPreferences.getString(key: acessTokenKey, defaultValue: "TOKEN_STATIC");
  setHasTokenUserLogged(String value) async => accessToken = await _localPreferences.setString(key: acessTokenKey, value: value);

}