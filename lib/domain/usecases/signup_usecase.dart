import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/dto/user_dtos.dart';
import 'package:spotify_clone/data/models/user_model.dart';
import 'package:spotify_clone/domain/repositories/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUseCase implements UseCase<Either<Failure, UserModel>, CreateUserReq> {
  @override
  Future<Either<Failure, UserModel>> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signUpWithEmail(params!);
  }

}

