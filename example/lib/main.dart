import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:audio_metadata/audio_metadata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioMetaData metaData;

  Future<void> initPlatformState() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['mp3'],
        type: FileType.custom,
      );

      if (result != null) {
        metaData = await AudioMetaDataManager.getAudioMetaData(
          result.files.single.path,
        );
        setState(() {});
      }
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 100),
            Center(
              child: FlatButton(
                onPressed: initPlatformState,
                child: const Text('Pick mp3 file'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(metaData?.toString() ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
