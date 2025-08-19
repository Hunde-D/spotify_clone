import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth_repository_impl.dart';
import 'package:spotify_clone/data/repository/song_repository_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_remote_datasource.dart';
import 'package:spotify_clone/data/sources/auth/firebase_auth_datasource.dart';
import 'package:spotify_clone/data/sources/songs/firestore_songs_datasource.dart';
import 'package:spotify_clone/data/sources/songs/songs_remote_datasource.dart';
import 'package:spotify_clone/domain/repositories/auth_repository.dart';
import 'package:spotify_clone/domain/repositories/song_repository.dart';
import 'package:spotify_clone/domain/usecases/get_new_songs_usecase.dart';
import 'package:spotify_clone/domain/usecases/get_recent_songs_usecase.dart';
import 'package:spotify_clone/domain/usecases/signin_usecase.dart';
import 'package:spotify_clone/domain/usecases/signup_usecase.dart';

final sl = GetIt.instance;


Future<void> initDependencies() async {

  // Registering data sources, repositories, and use cases

  // === Data sources ===
  sl.registerLazySingleton<AuthDataSource>(() => FirebaseAuthDataSourceImpl());
  sl.registerLazySingleton<SongDataSource>(() => FirestoreSongDatasource());

  // === Repositories ===
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<SongRepository>(() => SongRepositoryImpl());

  // === Use Cases ===
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUsecase>(() => SigninUsecase());
  sl.registerLazySingleton<GetNewSongsUsecase>(() => GetNewSongsUsecase());
  sl.registerLazySingleton<GetRecentSongsUsecase>(() => GetRecentSongsUsecase());

}