import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth_remote_datasource.dart';
import 'package:spotify_clone/data/sources/firebase_auth_datasource.dart';
import 'package:spotify_clone/domain/repositories/auth_repository.dart';
import 'package:spotify_clone/domain/usecases/signin_usecase.dart';
import 'package:spotify_clone/domain/usecases/signup_usecase.dart';

final sl = GetIt.instance;


Future<void> initDependencies() async {

  // Registering services, repositories, and data sources
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<AuthDataSource>(() => FirebaseAuthDataSourceImpl());
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());

}