import 'package:flutter/material.dart';

// component
import 'package:flutterdemo/components/AppBar/index.dart';
import 'package:flutterdemo/components/Message/MessageItem/index.dart';
import 'package:flutterdemo/components/Search/index.dart';
import 'package:flutterdemo/components/UserHead/UserInfo.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List massageList = [
    {"name": "张三", "updateOn": "2019-05-06", "message": "消息1"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "王五", "updateOn": "2019-07-06", "message": "消息3"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "995",
        leadingWidget: UserInfo.userHead,
        trailingWidget: Container(
            width: 30,
            height: 30,
            child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                onPressed: UserInfo.addFriend)),
      ),
      drawer: UserInfo.drawer,
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            Container(child: Search()),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (build, index) =>
                        MessageItemTile.tileBuild(massageList[index], index),
                    itemCount: massageList.length))
          ])),
    );
  }
}
