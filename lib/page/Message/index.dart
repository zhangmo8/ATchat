import 'package:flutter/material.dart';

// component
import 'package:flutterdemo/components/AppBar/index.dart';
import 'package:flutterdemo/components/Message/MessageItem/index.dart';
import 'package:flutterdemo/components/Search/index.dart';
import 'package:flutterdemo/components/UserHead/index.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List massageList = [
    {"name": "张三", "updateOn": "2019-05-06", "message": "消息1"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "王五", "updateOn": "2019-07-06", "message": "消息3"}
  ];

  get _drawer => Drawer(
        child: Text('This is Drawer'),
      );

  get _userHead => Builder(
      builder: (context) => UserHead(
            onTap: () => Scaffold.of(context).openDrawer(),
          ));

  void _addFriend() {
    print("加好友");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "995",
        leadingWidget: _userHead,
        trailingWidget: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.add),
            onPressed: _addFriend),
      ),
      drawer: _drawer,
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
