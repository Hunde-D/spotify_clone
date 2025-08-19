
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<Failure, List<SongEntity>>> getNewSongs();
  Future<Either<Failure, List<SongEntity>>> getRecentSongs();
}
