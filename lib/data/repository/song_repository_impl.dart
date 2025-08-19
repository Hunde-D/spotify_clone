
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/data/sources/songs/songs_remote_datasource.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/repositories/song_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SongRepositoryImpl implements SongRepository {
  @override
  Future<Either<Failure, List<SongEntity>>> getNewSongs() async {
    return await sl<SongDataSource>().getNewSongs();
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getRecentSongs() async {
    return await sl<SongDataSource>().getRecentSongs();
  }

}
