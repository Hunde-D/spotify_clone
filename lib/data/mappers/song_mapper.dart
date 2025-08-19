
import 'package:spotify_clone/data/models/song_model.dart';
import 'package:spotify_clone/domain/entities/song_entity.dart';

extension SongModelMapper on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      id: id,
      title: title,
      artist: artist,
      album: album,
      coverUrl: coverUrl,
      audioUrl: audioUrl,
      duration: duration,
      addedDate: addedDate,
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'coverUrl': coverUrl,
      'audioUrl': audioUrl,
      'duration': duration,
      'addedDate': addedDate,
    };
  }
}

extension SongEntityMapper on SongEntity {
  SongModel toModel() {
    return SongModel(
      id: id,
      title: title,
      artist: artist,
      album: album,
      coverUrl: coverUrl,
      audioUrl: audioUrl,
      duration: duration,
      addedDate: addedDate,
    );
  }
}