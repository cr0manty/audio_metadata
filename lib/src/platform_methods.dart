import 'dart:async';

import 'package:audio_metadata/src/metadata_model.dart';
import 'package:flutter/services.dart';

class AudioMetadata {
  static const MethodChannel _channel = const MethodChannel('audio_metadata');

  static Future<AudioMetaData> getAudioMetaData(String filePath) async {
    final Map metaDataJson = await _channel.invokeMethod(
      'audio_meta',
      <String, dynamic>{'file_path': filePath},
    );
    final AudioMetaData metaData = AudioMetaData.fromJson(metaDataJson);
    return metaData;
  }
}
