
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/presentation/player/bloc/player_state.dart';

class PlayerCubit extends Cubit<SongPlayerState> {

  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  bool isPlaying = false;

  PlayerCubit() : super(SongPlayerLoading()){
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration ?? Duration.zero;
    });
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      _updateSongPosition();
    });

    audioPlayer.playingStream.listen((playing) {
      isPlaying = playing;
      _updateSongPosition();
    });
  }

  void _updateSongPosition ()  => emit(SongPlayerLoaded());

  Future<void> loadSong(String audioUrl) async {
      emit(SongPlayerLoading());
    try {
      await audioPlayer.setUrl(audioUrl);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailed(message: e.toString()));
    }
  }

  void playOrPause() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }

}