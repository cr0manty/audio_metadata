import 'dart:convert';

class AudioMetaData {
  final String fileOwner;
  final String album;
  final String albumArtist;
  final String copyright;
  final String subtitle;
  final double lengthInMilliseconds;
  final int sizeInBytes;
  final String genre;
  final String artist;
  final String title;
  final String originalFilename;
  final double creationDateStamp;

  const AudioMetaData({
    this.album,
    this.albumArtist,
    this.title,
    this.artist,
    this.copyright,
    this.fileOwner,
    this.genre,
    this.lengthInMilliseconds,
    this.originalFilename,
    this.sizeInBytes,
    this.subtitle,
    this.creationDateStamp,
  });

  factory AudioMetaData.fromJson(Map json) => AudioMetaData(
        album: json['album'],
        albumArtist: json['album_artist'],
        title: json['title'],
        artist: json['artist'],
        copyright: json['copyright'],
        fileOwner: json['file_owner'],
        genre: json['genre'],
        lengthInMilliseconds: json['length_in_milliseconds'],
        originalFilename: json['original_filename'],
        sizeInBytes: json['size_in_bytes'],
        subtitle: json['subtitle'],
        creationDateStamp: json['creation_date_stamp'],
      );

  Map<String, dynamic> toJson() => {
        'album': album,
        'album_artist': albumArtist,
        'title': title,
        'artist': artist,
        'copyright': copyright,
        'file_owner': fileOwner,
        'genre': genre,
        'length_in_milliseconds': lengthInMilliseconds,
        'original_filename': originalFilename,
        'size_in_bytes': sizeInBytes,
        'subtitle': subtitle,
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
      DateTime.fromMicrosecondsSinceEpoch(creationDateStamp.toInt() * 1000);

  @override
  String toString() => jsonEncode(toJson());
}
