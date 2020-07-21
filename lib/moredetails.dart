import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'dart:math';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = ScrollController();

  bool notification;

  @override
  void initState() {
    super.initState();
    notification = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              title: Text('詳細資料'),
              actions: [
                IconButton(
                  icon: Icon(
                    notification
                        ? Icons.notifications
                        : Icons.notifications_off,
                  ),
                  onPressed: () {
                    setState(() => notification = !notification);
                  },
                ),
              ],
            )),
        body: Snap(
          controller: controller.appBar,
          child: ListView.builder(
            controller: controller, // Controller is also here
            itemBuilder: _listBuildItem,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _listBuildItem(BuildContext context, int index) {
    return Container(
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
            padding:
                const EdgeInsets.only(top: 25, left: 20, bottom: 25, right: 30),
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
    );
  }
}
