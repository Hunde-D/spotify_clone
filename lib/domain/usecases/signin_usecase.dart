import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/data/models/user_model.dart';
import 'package:spotify_clone/domain/repositories/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninUsecase implements UseCase<Either<Failure, UserModel>, SignInReq> {
  @override
  Future<Either<Failure, UserModel>> call({SignInReq? params}) async {
    return await sl<AuthRepository>().signInWithEmail(params!);
  }

}