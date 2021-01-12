# audio_metadata

Plugin allows you to get metadata from any mp3 file for both mobile platforms (iOS and Android)

## Getting Started

A simple usage example:

```
import 'package:audio_metadata/audio_metadata.dart';

final AudioMetaData metaData = await AudioMetadata.getAudioMetaData(result.files.single.path);
print(metaData.title);

```

## Support fields
  * **fileOwner**
  * **album**
  * **albumArtist**
  * **copyright**
  * **subtitle**
  * **lengthInMilliseconds**
  * **sizeInBytes**
  * **genre**
  * **artist**
  * **title**
  * **originalFilename**
  * **creationDateStamp**

## Support Platform

- [x] IOS
- [ ] Android


