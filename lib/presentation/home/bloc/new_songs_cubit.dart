import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/get_new_songs_usecase.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    emit(NewSongsLoading());
    final songs = await sl<GetNewSongsUsecase>().call();
    songs.fold(
      (failure) => emit(NewSongsFailed(failure.message)),
      (data) => emit(NewSongsLoaded(songs: data)),
    );
  }
}
