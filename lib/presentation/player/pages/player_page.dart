import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/format_duration.dart';
import 'package:spotify_clone/common/widgets/custom_app_bar.dart';
import 'package:spotify_clone/common/widgets/song_card.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';
import 'package:spotify_clone/presentation/player/bloc/player_cubit.dart';
import 'package:spotify_clone/presentation/player/bloc/player_state.dart';

class PlayerPage extends StatelessWidget {
  // final SongEntity song;
  const PlayerPage({super.key});
  // const PlayerPage({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    final song = ModalRoute.of(context)!.settings.arguments as SongEntity;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Now playing',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: BlocProvider(
        create: (context) => PlayerCubit()..loadSong(song.audioUrl),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 12,
            children: [
              SongCard(
                coverUrl: song.coverUrl,
                title: song.title,
                artist: song.artist,
                showFavorite: true,
                width: double.infinity,
                height: 370,
              ),
              BlocBuilder<PlayerCubit, SongPlayerState>(
                builder: (context, state) {
                  if (state is SongPlayerLoading) {
                    return CircularProgressIndicator();
                  } else if (state is SongPlayerLoaded) {
                    return Column(
                      spacing: 12,
                      children: [
                        Slider(
                          value: context
                              .read<PlayerCubit>()
                              .songPosition
                              .inSeconds
                              .toDouble(),
                          min: 0.0,
                          max: context
                              .read<PlayerCubit>()
                              .songDuration
                              .inSeconds
                              .toDouble(),
                          onChanged: (value) {
                            context.read<PlayerCubit>().audioPlayer.seek(
                              Duration(seconds: value.toInt()),
                            );
                          },
                          padding: EdgeInsets.zero,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formatDuration(
                                context.read<PlayerCubit>().songPosition,
                              ),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).textTheme.labelMedium?.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              formatDuration(
                                context.read<PlayerCubit>().songDuration,
                              ),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).textTheme.labelMedium?.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              color: Theme.of(context).primaryColor,
                              shape: const CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () {
                                  context.read<PlayerCubit>().playOrPause();
                                },
                                child: SizedBox(
                                  width: 72,
                                  height: 72,
                                  child: context.read<PlayerCubit>().isPlaying ?
                                    Icon(
                                      CupertinoIcons.pause_solid,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                      size: 28,
                                    ) : Icon(
                                      CupertinoIcons.play_arrow_solid,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                      size: 28,
                                    ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (state is SongPlayerFailed) {
                    return Text('Error: ${state.message}');
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
