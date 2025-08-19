
import 'package:spotify_clone/domain/entities/song_entity.dart';

abstract class NewSongsState {}


class NewSongsLoading extends NewSongsState {}

class NewSongsLoaded extends NewSongsState {
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}

class NewSongsFailed extends NewSongsState {
  final String message;

  NewSongsFailed(this.message);
}
