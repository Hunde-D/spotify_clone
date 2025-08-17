import 'package:spotify_clone/data/models/user_model.dart';
import 'package:spotify_clone/domain/entities/user_entity.dart';

extension UserModelMapper on UserModel {
  UserEntity toEntity() => UserEntity(id: id, fullName: fullName, email: email);
}

// extension UserEntityMapper on UserEntity {
//   UserModel toModel() => UserModel(id: id, fullName: fullName, email: email);
// }
