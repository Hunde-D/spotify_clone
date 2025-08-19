import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(SignInReq user);
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword(CreateUserReq newUser);
}

