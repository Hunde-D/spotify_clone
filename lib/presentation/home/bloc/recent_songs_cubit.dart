import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/repositories/song_repository.dart';
import 'package:spotify_clone/presentation/home/bloc/recent_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class RecentSongsCubit extends Cubit<RecentSongsState> {
  RecentSongsCubit() : super(RecentSongsLoading());

  void getRecentSongs() async {
    final recentSongs = await sl<SongRepository>().getRecentSongs();
    recentSongs.fold(
      (failure) => emit(RecentSongsFailure(failure.message)),
      (data) => emit(RecentSongsLoaded(songs: data)),
    );
  }
}
