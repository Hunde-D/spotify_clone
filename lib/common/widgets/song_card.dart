import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class SongCard extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String artist;
  final bool showPlayButton;
  final bool showFavorite;
  final double width;
  final double height;

  const SongCard({
    super.key,
    required this.coverUrl,
    required this.title,
    required this.artist,
    this.showPlayButton = false,
    this.showFavorite = false,
    this.width = 147,
    this.height = 185,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: showPlayButton
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 29,
                        height: 29,
                        transform: Matrix4.translationValues(-8, 8, 0),
                        decoration: BoxDecoration(
                          color: context.isDarkMode
                              ? const Color(0xff2C2C2C)
                              : const Color(0xffE6E6E6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          CupertinoIcons.play_arrow_solid,
                          color: context.isDarkMode
                              ? const Color(0xff959595)
                              : const Color(0xff555555),
                          size: 16,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(height: showPlayButton ? 8 : 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: showPlayButton ? 16.0 : 20.0,
                      ),
                    ),
                    Text(
                      artist,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: showPlayButton ? 14.0 : 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              if (showFavorite)
                const Icon(
                  Icons.favorite_border,
                  size: 24,
                  color: Color(0xff565656),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
