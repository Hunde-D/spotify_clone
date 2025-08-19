import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final String audioUrl;
  final num duration;
  final Timestamp addedDate;

  SongEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.addedDate,
    required this.audioUrl,
    required this.coverUrl,
  });
}
