
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/repositories/song_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class GetRecentSongsUsecase implements UseCase<Either<Failure, List<SongEntity>>, dynamic> {
  @override
  Future<Either<Failure, List<SongEntity>>> call({params}) async {
    return await sl<SongRepository>().getRecentSongs();
  }

}