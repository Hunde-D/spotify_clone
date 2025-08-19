import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/presentation/home/bloc/recent_songs_cubit.dart';
import 'package:spotify_clone/presentation/home/bloc/recent_songs_state.dart';

class RecentSongs extends StatelessWidget {
  const RecentSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecentSongsCubit()..getRecentSongs(),
      child: BlocBuilder<RecentSongsCubit, RecentSongsState>(
        builder: (context, state) {
          if (state is RecentSongsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecentSongsLoaded) {
            return ListView.separated(
              itemCount: state.songs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              itemBuilder: (context, index) {
                final song = state.songs[index];
                return Row(
                  spacing: 24,
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? Color(0xff2C2C2C)
                            : Color(0xffE6E6E6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.play_arrow_solid,
                        color: context.isDarkMode
                            ? Color(0xff959595)
                            : Color(0xff555555),
                        size: 17,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/player',
                          arguments: song
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(fontSize: 16.0),
                            ),
                            Text(
                              song.artist,
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      song.duration.toString(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(Icons.favorite, color: Color(0xff565656)),
                  ],
                );
              },
            );
          } else if (state is RecentSongsFailure) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
