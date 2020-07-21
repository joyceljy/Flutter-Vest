import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chart.dart';
import 'soundRecord.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '首頁'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              title: Text(widget.title),
            )),
        body: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(450),
              width: ScreenUtil.screenWidth,
              color: Colors.pink[100],
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 40, top: 50),
                        child: Image.asset('assets/memberpic.png', scale: 0.9),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 50),
                            child: Text(
                              "User's Name",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "查看基本資料",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                color: Colors.pink[50],
                height: (ScreenUtil().scaleHeight + 550),
                width: ScreenUtil.screenWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Text(
                        "最新數據",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 20, bottom: 25, right: 30),
                            child: Text(
                              "13:50",
                              style: TextStyle(fontSize: 60),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  "拍擊力道： 適中",
                                  style: TextStyle(fontSize: 23),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  "拍擊次數：130次",
                                  style: TextStyle(fontSize: 23),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 70, left: 10),
                            child: RaisedButton(
                                color: Colors.pink[50],
                                elevation: 0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChartPage()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/chart.png', scale: 0.8),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 5),
                                      child: Text(
                                        "圖表分析",
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 70, left: 10),
                            child: RaisedButton(
                                color: Colors.pink[50],
                                elevation: 0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChartPage()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/medicalHistory.png',
                                        scale: 0.8),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 5),
                                      child: Text(
                                        "就醫記錄",
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    ),
                                  ],
                                ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 70, left: 10),
                            child: RaisedButton(
                                color: Colors.pink[50],
                                elevation: 0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SoundRecordPage()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Image.asset('assets/soundRecord.png',
                                        scale: 0.8),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 5),
                                      child: Text(
                                        "拍痰錄製",
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    ),
                                  ],
                                ))),
                      ],
                    )
                  ],
                )),
          ],
        ));
  }
}
