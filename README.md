# audio_metadata

Plugin allows you to get metadata from any mp3 file for both mobile platforms (iOS and Android)

## Getting Started

A simple usage example:

```
import 'package:audio_metadata/audio_metadata.dart';

final AudioMetaData metaData = await AudioMetaDataManager.getAudioMetaData(filePath);
print(metaData.title);

```

## Support fields
  * **album**
  * **albumArtist**
  * **duration**
  * **sizeInBytes**
  * **genre**
  * **artist**
  * **title**
  * **filename**
  * **creationDate**

## Support Platform

- [x] IOS
- [x] Android


