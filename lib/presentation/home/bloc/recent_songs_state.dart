import 'package:spotify_clone/domain/entities/song_entity.dart';

abstract class RecentSongsState {}

class RecentSongsLoading extends RecentSongsState {}

class RecentSongsLoaded extends RecentSongsState {
  final List<SongEntity> songs;

  RecentSongsLoaded({required this.songs});
}

class RecentSongsFailure extends RecentSongsState {
  final String message;

  RecentSongsFailure(this.message);
}
