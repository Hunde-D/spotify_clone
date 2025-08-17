
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signInWithEmail(SignInReq user);
  Future<Either<Failure, UserModel>> signUpWithEmail(CreateUserReq newUser);
}
