import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/widgets/song_card.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/new_songs_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewSongsCubit()..getNewSongs(),
      child: BlocBuilder<NewSongsCubit, NewSongsState>(
        builder:(context, state){
          if (state is NewSongsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewSongsLoaded) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.songs.length,
              padding: const EdgeInsets.only(left:24.0),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final song = state.songs[index];
                return SongCard(
                  coverUrl: song.coverUrl,
                  title: song.title,
                  artist: song.artist,
                  showPlayButton: true,
                );
              },
            );
          } else if (state is NewSongsFailed) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
      
      }),
    );
  }
}
