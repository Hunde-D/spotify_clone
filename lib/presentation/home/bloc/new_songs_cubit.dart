import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:spotify_clone/data/mappers/song_mapper.dart';
import 'package:spotify_clone/data/models/song_model.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/domain/usecases/get_new_songs_usecase.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_state.dart';
import 'package:spotify_clone/service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  IO.Socket? _socket;
  NewSongsCubit() : super(NewSongsLoading()) {
    _initWebSocket();
  }

  Future<void> getNewSongs() async {
    emit(NewSongsLoading());
    final songs = await sl<GetNewSongsUsecase>().call();
    songs.fold(
      (failure) => emit(NewSongsFailed(failure.message)),
      (data) => emit(NewSongsLoaded(songs: data)),
    );
  }

  void _initWebSocket() {
    _socket = IO.io(
      'https://music-app-notification-api.onrender.com',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );
    _socket?.onConnect((_) {
      print("⚡ WebSocket connected!");
    });

    _socket?.on('new_song', (data) {
      print("⚡ New song event received: $data");

      if (state is NewSongsLoaded) {
        final currentState = state as NewSongsLoaded;
        final updatedSongs = List<SongEntity>.from(currentState.songs);

        final incomingSong = SongModel.fromJson(
          Map<String, dynamic>.from(data),
          id: data['id'],
        );

        // Check if song exists → update or add
        final index = updatedSongs.indexWhere((s) => s.id == incomingSong.id);
        if (index != -1) {
          updatedSongs[index] = incomingSong.toEntity();
        } else {
          updatedSongs.insert(0, incomingSong.toEntity());
        }
        emit(NewSongsLoaded(songs: updatedSongs));
      }
    });
    _socket?.onDisconnect((_) {
      print("❌ WebSocket disconnected!");
    });
  }

  @override
  Future<void> close() {
    _socket?.dispose();
    return super.close();
  }

}
