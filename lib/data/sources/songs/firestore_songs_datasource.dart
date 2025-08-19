
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/data/mappers/song_mapper.dart';
import 'package:spotify_clone/data/models/song_model.dart';
import 'package:spotify_clone/data/sources/songs/songs_remote_datasource.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

class FirestoreSongDatasource implements SongDataSource {
  @override
  Future<Either<Failure, List<SongEntity>>> getNewSongs() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('Songs').orderBy('addedDate', descending: true).limit(3).get();
      final songs = snapshot.docs
          .map((doc) => SongModel.fromJson(doc.data()))
          .map((model) => model.toEntity())
          .toList();
      return Right(songs);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firestore error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, List<SongEntity>>> getRecentSongs() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('Songs').orderBy('addedDate', descending: true).limit(3).get();
      final songs = snapshot.docs
          .map((doc) => SongModel.fromJson(doc.data()))
          .map((model) => model.toEntity())
          .toList();
      return Right(songs);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? 'Firestore error'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}