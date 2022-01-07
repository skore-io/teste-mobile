import 'package:score_cursos/app/common/entities/user.entity.dart';

class UserModel implements UserEntity{
  @override
  String? email;

  @override
  String? imageSrc;

  @override
  String? name;

  @override
  String? uid;

  UserModel(this.email, this.imageSrc, this.name, this.uid);
}