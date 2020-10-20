import 'package:flutter/material.dart';
// pkg
import 'package:flutter_collapse/flutter_collapse.dart';

import 'package:flutterdemo/components/UserHead/index.dart';
import 'package:flutterdemo/utils/NoSrollOver.dart';

class FriendTypes extends StatefulWidget {
  FriendTypes({Key key}) : super(key: key);

  @override
  _FriendTypesState createState() => _FriendTypesState();
}

class _FriendTypesState extends State<FriendTypes> {
  List typeList = [
    {
      "title": "好友",
      "value": false,
      "children": [
        {"userName": "张三", "message": "在吗?GG", "time": "17:15:00"},
        {"userName": "李四", "message": "借我点钱", "time": "17:15:00"},
        {"userName": "王五", "message": "我下个月结婚", "time": "17:15:00"},
        {"userName": "赵刘", "message": "GTU冲", "time": "17:15:00"},
      ],
    },
    {
      "title": "同学",
      "value": false,
      "children": [
        {"userName": "张楚岚", "message": "在吗?GG", "time": "17:15:00"},
        {"userName": "张子凡", "message": "借我点钱", "time": "17:15:00"},
        {"userName": "灵烟", "message": "我下个月结婚", "time": "17:15:00"},
        {"userName": "宝儿姐", "message": "GTU冲", "time": "17:15:00"},
      ],
    },
    {
      "title": "亲人",
      "value": false,
      "children": [
        {"userName": "无敌的芥末", "message": "啥时候回家?", "time": "17:15:00"},
        {"userName": "爱施德", "message": "还有钱花么?", "time": "17:15:00"},
      ],
    },
  ];

  List<Widget> renderType(List childList) {
    return childList
        .map(
          (e) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: UserHead(
              size: 40.0,
              onTap: () {},
            ),
            title: Text(e["userName"]),
            subtitle: Text(e["message"]),
            trailing: Text(
              e["time"],
              style: TextStyle(color: Colors.grey),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: UnderlineTabIndicator(
          borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
        ),
        child: ScrollConfiguration(
          behavior: NoShadowScrollBehavior(),
          child: ListView.builder(
            itemCount: typeList.length,
            itemBuilder: (content, index) {
              final e = typeList[index];
              return Collapse(
                title: Text(
                  e["title"],
                  style: TextStyle(color: Colors.black),
                ),
                body: Column(children: renderType(e["children"])),
                value: e["value"],
                onChange: (v) {
                  final i = typeList
                      .indexWhere((element) => element["title"] == e["title"]);
                  setState(() {
                    typeList[i]["value"] = v;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
