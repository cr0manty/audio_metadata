import 'dart:convert';

class AudioMetaData {
  final String album;
  final String albumArtist;
  final String subtitle;
  final double duration;
  final int sizeInBytes;
  final String genre;
  final String artist;
  final String title;
  final String filename;
  final double creationDateStamp;

  const AudioMetaData({
    this.album,
    this.albumArtist,
    this.title,
    this.artist,
    this.genre,
    this.duration,
    this.filename,
    this.sizeInBytes,
    this.subtitle,
    this.creationDateStamp,
  });

  factory AudioMetaData.fromJson(Map json) => AudioMetaData(
        album: json['album'],
        albumArtist: json['album_artist'],
        title: json['title'],
        artist: json['artist'],
        genre: json['genre'],
        duration: json['duration'],
        filename: json['filename'],
        sizeInBytes: json['size_in_bytes'],
        subtitle: json['subtitle'],
        creationDateStamp: json['creation_date_stamp'],
      );

  Map<String, dynamic> toJson() => {
        'album': album,
        'album_artist': albumArtist,
        'title': title,
        'artist': artist,
        'genre': genre,
        'duration': duration,
        'filename': filename,
        'size_in_bytes': sizeInBytes,
        'creation_date_stamp': creationDateStamp,
      };

  String get name {
    if (artist == null && title != null) {
      return title;
    } else if (artist != null && title == null) {
      return artist;
    } else if (artist != null && title != null) {
      return '$artist - $title';
    }
    return 'Unknown';
  }

  DateTime get creationDate =>
      DateTime.fromMillisecondsSinceEpoch(creationDateStamp.toInt() * 1000);

  @override
  String toString() => jsonEncode(toJson());
}
