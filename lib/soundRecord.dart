import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoundRecordPage extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  SoundRecordPage({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _SoundRecordPageState createState() => _SoundRecordPageState();
}

class _SoundRecordPageState extends State<SoundRecordPage> {
  Recording _recording = new Recording();
  bool _isRecording = false;
  Random random = new Random();
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    var height = ScreenUtil.screenHeight;
    var width = ScreenUtil.screenWidth;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              title: Text('拍痰錄製'),
            )),
        body: Center(
            child: Container(
                height: ScreenUtil.screenHeight,
                width: ScreenUtil.screenWidth,
                color: Colors.pink[100],
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: height / 3.5),
                              child: Image.asset('assets/soundRecord.png',
                                  scale: 0.6),
                            ),
                            new Row(
                              children: <Widget>[
                                IconButton(
                                  padding: EdgeInsets.only(
                                      left: width / 2.8, top: 30),
                                  icon: Image.asset('assets/recordStart.png'),
                                  iconSize: 50,
                                  onPressed: () {
                                    _start();
                                  },
                                ),
                                IconButton(
                                  padding: EdgeInsets.only(top: 30),
                                  icon: Image.asset('assets/recordStop.png'),
                                  iconSize: 50,
                                  onPressed: () {
                                    _stop();
                                  },
                                ),
                              ],
                            ),
                            new Text(
                                "Audio recording duration : ${_recording.duration.toString()}")
                          ]),
                    ),
                  ],
                ))));
  }

  _start() async {
    try {
      if (await AudioRecorder.hasPermissions) {
        if (_controller.text != null && _controller.text != "") {
          String path = _controller.text;
          if (!_controller.text.contains('/')) {
            io.Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
            path = appDocDirectory.path + '/' + _controller.text;
          }
          print("Start recording: $path");
          await AudioRecorder.start(
              path: path, audioOutputFormat: AudioOutputFormat.AAC);
        } else {
          await AudioRecorder.start();
        }
        bool isRecording = await AudioRecorder.isRecording;
        setState(() {
          _recording = new Recording(duration: new Duration(), path: "");
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var recording = await AudioRecorder.stop();
    print("Stop recording: ${recording.path}");
    bool isRecording = await AudioRecorder.isRecording;
    File file = widget.localFileSystem.file(recording.path);
    print("  File length: ${await file.length()}");
    setState(() {
      _recording = recording;
      _isRecording = isRecording;
    });
    _controller.text = recording.path;
    _route();
  }

  _route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ResultPage()));
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = ScreenUtil.screenHeight;
    var width = ScreenUtil.screenWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text("錄製結果"),
      ),
      body: Center(
        child: Container(
            height: ScreenUtil.screenHeight,
            width: ScreenUtil.screenWidth,
            color: Colors.pink[100],
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: height / 10),
                  child: Text("與正確拍痰符合度",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 30)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("90%",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 70)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 70),
                  child: Image.asset('assets/recordResult.png', scale: 0.6),
                ),
                RaisedButton(
                  //padding:EdgeInsets.only(top: 50) ,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('返回首頁', style: TextStyle(fontSize: 25)),
                  color: Colors.purple[200],
                )
              ],
            )),
      ),
    );
  }
}
