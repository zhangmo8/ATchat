import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/components/AppBar/index.dart';
import 'package:flutterdemo/components/Input/Message.dart';
import 'package:flutterdemo/components/Message/MessageSession.dart';
import 'package:flutterdemo/utils/NoSrollOver.dart';

class MessageDetailPage extends StatefulWidget {
  final Map messInfo;
  MessageDetailPage({Key key, this.messInfo}) : super(key: key);

  @override
  _MessageDetailPageState createState() => _MessageDetailPageState(messInfo);
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  final Map messInfo;
  final ScrollController _controller = ScrollController();
  List<Map> messageList = [
    {"type": "other", "msg": "flutter仿的聊天么?"},
    {"type": "me", "msg": "对啊"},
    {"type": "me", "msg": "咋滴有啥疑问么?"},
    {"type": "other", "msg": "没有,就是问问"},
    {"type": "other", "msg": "牛逼"},
    {"type": "me", "msg": "没有没有,垃圾的很"},
    {"type": "other", "msg": "老张又谦虚"},
    {"type": "me", "msg": "没有没有,垃圾,不会后端,刘大佬牛逼"},
    // {
    //   "type": "me",
    //   "msg":
    //       " 哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈好哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈好哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈hhhhhhhhhhhhhhhh"
    // },
  ];

  _MessageDetailPageState(this.messInfo);
  changeList(value) {
    setState(() {
      this.messageList.add({"type": "me", "msg": value});
    });
  }

  static const EdgeInsets zero = EdgeInsets.zero;
  @override
  Widget build(BuildContext context) {
    final List list = messageList.reversed.toList();
    // _controller.jumpTo(_controller.position.maxScrollExtent);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: messInfo["name"] ?? "正在加载中...",
          centerTitle: true,
          leadingWidget: IconButton(
            padding: zero,
            icon: Icon(Icons.navigate_before),
            onPressed: () => Navigator.pop(context),
          ),
          trailingWidget: IconButton(
            padding: zero,
            icon: Icon(Icons.more_vert),
            onPressed: () {
              BotToast.showText(text: "点击了菜单");
            },
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoShadowScrollBehavior(),
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      shrinkWrap: true,
                      itemBuilder: (build, index) =>
                          MessageSession(msgDetail: list[index]),
                      itemCount: list.length,
                    ),
                  ),
                ),
                MessageInput(sendMsg: changeList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
