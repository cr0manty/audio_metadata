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
  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    AudioMetaData metaData;
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles();

      if (result != null) {
        metaData = await AudioMetadata.getAudioMetaData(
          result.files.single.path,
        );
        print(metaData);
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
        body: Center(
          child: FlatButton(
            onPressed: initPlatformState,
            child: const Text('Pick mp3 file'),
          ),
        ),
      ),
    );
  }
}
