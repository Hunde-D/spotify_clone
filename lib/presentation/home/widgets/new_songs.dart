import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
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
                return SizedBox(
                  width: 147,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 185,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(song.coverUrl),  
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 29,
                              height: 29,
                              transform: Matrix4.translationValues(-8, 8, 0),
                              decoration: BoxDecoration(
                                color: context.isDarkMode ? Color(0xff2C2C2C) : Color(0xffE6E6E6),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                CupertinoIcons.play_arrow_solid,
                                color: context.isDarkMode ? Color(0xff959595) : Color(0xff555555),
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(song.title, 
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.0,
                      ),
                      ),
                      Text(song.artist,
                      overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
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
