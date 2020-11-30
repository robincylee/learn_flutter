import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  String statusText = "";
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(),
        body: new Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: RaisedButton(
                    child: Text("Start"),
                    onPressed: () {
                      startRecord();
                    },
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("Stop"),
                    onPressed: () {
                      stopRecord();
                    },
                  ),
                  flex: 2,
                )
              ],
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Scaffold(
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerFloat,
                      floatingActionButton: Container(
                        height: MediaQuery.of(context).size.width * 0.19,
                        width: MediaQuery.of(context).size.width * 0.19,
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.mic,
                            size: 40,
                          ),
                          backgroundColor: Colors.amber[300],
                          onPressed: () {
                            // Navigator.pop(context, getRandom());
                            //add mic record function
                            if (recordFilePath != null &&
                                File(recordFilePath).existsSync()) {
                              uploadFile(recordFilePath);
                            }
                          },
                        ),
                      ),
                      // margin: EdgeInsets.all(10),
                      // decoration: const ShapeDecoration(
                      //   color: Colors.blue,
                      //   shape: CircleBorder(),
                      // ),

                      // child: IconButton(
                      //   splashColor: Colors.amber,
                      //   splashRadius: 45,
                      //   padding: EdgeInsets.all(28),
                      //   icon: Icon(Icons.mic),
                      //   onPressed: () {
                      //     Navigator.pop(context, getRandom());
                      //   },
                      // ),
                    )))
          ],
        )));
  }

  Future<int> uploadFile(String filePath) async {
    var postUri = Uri.parse("http://54.255.28.125:4042/uploadfile/");

    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
    request.fields['id'] = '1234321';
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('upload_file', filePath);

    request.files.add(multipartFile);

    http.StreamedResponse response = await request.send();

    print(response.statusCode);
    return response.statusCode;
  }

  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    if (!await Permission.storage.isGranted) {
      PermissionStatus status = await Permission.storage.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      print(recordFilePath);
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No permission";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  String recordFilePath;

  void play() async {
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      int s = await uploadFile(recordFilePath);
      print(s);
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(recordFilePath, isLocal: true);
    }
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    final externalDirectory = await getExternalStorageDirectory();
    String sdPath = externalDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
}

getRandom() {
  int lucky = Random().nextInt(3);
  switch (lucky) {
    case 0:
      return 'Success';
    case 1:
      return 'Fail';
    case 2:
      return 'No changes';
  }
}
