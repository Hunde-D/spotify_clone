import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String coverUrl;
  final String audioUrl;
  final num duration;
  final Timestamp addedDate;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
    required this.audioUrl,
    required this.duration,
    required this.addedDate,
  });

  factory SongModel.fromFirestore(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return SongModel(
      id: id,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      coverUrl: json['coverUrl'] as String,
      audioUrl: json['audioUrl'] as String,
      duration: json['duration'] as num,
      addedDate: json['addedDate'] as Timestamp,
    );
  }
  factory SongModel.fromJson(Map<String, dynamic> json, {required String id}) {
    return SongModel(
      id: id,
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      coverUrl: json['coverUrl'] as String,
      audioUrl: json['audioUrl'] as String,
      duration: json['duration'] as num,
      addedDate: Timestamp.fromDate(
        DateTime.parse(json['addedDate'] as String),
      ),
    );
  }

}
