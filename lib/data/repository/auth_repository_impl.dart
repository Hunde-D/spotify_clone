import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/data/models/user_model.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_datasource.dart';
import 'package:spotify_clone/domain/repositories/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserModel>> signInWithEmail(SignInReq user) async {
    return await sl<AuthDataSource>().signInWithEmailAndPassword(user);
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmail(CreateUserReq newUser) async {
    return await sl<AuthDataSource>().signUpWithEmailAndPassword(newUser);
  }
}
