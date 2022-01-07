import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:score_cursos/app/common/core/config_manager.dart';
import 'package:score_cursos/app/common/entities/user.entity.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:score_cursos/app/common/models/user.model.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;
abstract class _SplashStoreBase with Store {

  final ConfigManager _configManager = Modular.get();

  initialize({Function? onError})async{
    await Future.delayed(const Duration(seconds: 3));
    bool? sucessLoadConfigs = await _configManager.initialize();
    if(sucessLoadConfigs??false){
      _verifications();
    }else{
      onError!("Não foi possível iniciar o aplicativo. Desinstale e instale novamente.");
    }
  }

  void _verifications(){
    if(_configManager.firstAccess){
      Modular.to.pushReplacementNamed(introRoute);
    }else{
      _verifyUserLogged();
    }
  }

  void _verifyUserLogged()async{
    if(_configManager.accessToken.isEmpty){
      Modular.to.pushReplacementNamed(homeRoute);
    }else{
      UserEntity? user = await loadUser();
      Modular.to.pushReplacementNamed(homeRoute, arguments: user);
    }
  }

  Future<UserEntity>? loadUser()async{
    /// TODO SE ESTIVER COM UM TOKEN VALIDO ARMAZENADO, FAZ A REQUISIÇÃO TRAZENDO O USUARIO ATRAVÉS DE UM ENDPOINT
    return UserModel('tec_vagner.ti@outlook.com', 'assets/images/photo.jpg', 'Vagner Willian', 'abc123');
  }
}