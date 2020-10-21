import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// component
import 'package:flutterdemo/components/AppBar/index.dart';
import 'package:flutterdemo/components/Message/MessageItem/index.dart';
import 'package:flutterdemo/components/Search/index.dart';
import 'package:flutterdemo/components/UserHead/UserInfo.dart';
import 'package:flutterdemo/page/Message/MessageDetail.dart';
import 'package:flutterdemo/utils/NoSrollOver.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List massageList = [
    {"name": "张三", "updateOn": "2019-05-06", "message": "消息1"},
    {"name": "李四", "updateOn": "2019-06-06", "message": "消sadfasdf息2"},
    {"name": "王五", "updateOn": "2019-07-06", "message": "消息3"},
    {"name": "赵六", "updateOn": "2019-07-06", "message": "消息3"},
    {"name": "徐七", "updateOn": "2019-07-06", "message": "消息3"},
    {"name": "刘八", "updateOn": "2019-07-06", "message": "消息3"},
    {"name": "梅九", "updateOn": "2019-07-06", "message": "消息3"},
    {"name": "刘大佬", "updateOn": "2020-10-21", "message": "刘大佬牛逼"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "995",
        leadingWidget: UserInfo.userHead,
        trailingWidget: UserInfo.popMenu(),
      ),
      drawer: UserInfo.drawer,
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            Container(child: Search()),
            Expanded(
              child: ScrollConfiguration(
                behavior: NoShadowScrollBehavior(),
                child: ListView.builder(
                    itemBuilder: (build, index) {
                      return MessageItemTile.tileBuild(
                          massageList[index], index, onTap: (item) {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) {
                          // 目标页面，即一个 Widget
                          return MessageDetailPage(messInfo: item);
                        }));
                      });
                    },
                    itemCount: massageList.length),
              ),
            )
          ])),
    );
  }
}
