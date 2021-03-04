import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInput extends StatefulWidget {
  final Function sendMsg;
  MessageInput({Key key, this.sendMsg}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  static const InputDecoration messageInputClass = InputDecoration(
    filled: true,
    isDense: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(fontSize: 14.0),
    contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  static const EdgeInsets btnPadding = EdgeInsets.zero;

  final TextEditingController _controller = TextEditingController();

  bool voiceShow = false;
  String msg = "";

  Widget getContent() {
    if (voiceShow) {
      return RaisedButton(
        onPressed: () {
          BotToast.showText(text: "说话成功");
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0.w)),
        color: Colors.white,
        padding: EdgeInsets.all(10.w),
        child: Text("按住说话", textAlign: TextAlign.center),
      );
    } else {
      return Container(
        child: TextField(
          controller: _controller,
          decoration: messageInputClass,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          onChanged: (val) {
            setState(() {
              msg = val;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Row(
        children: [
          IconButton(
            padding: btnPadding,
            icon: Icon(voiceShow ? Icons.keyboard : Icons.keyboard_voice),
            onPressed: () {
              setState(() {
                this.voiceShow = !this.voiceShow;
              });
            },
          ),
          Expanded(child: getContent()),
          if (!voiceShow)
            IconButton(
              padding: btnPadding,
              icon: Icon(Icons.send),
              onPressed: (msg.length == 0 || msg.trim() == "")
                  ? null
                  : () {
                      widget.sendMsg(msg);
                      setState(() {
                        msg = "";
                      });
                      _controller.clear();
                    },
            ),
          IconButton(
            padding: btnPadding,
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              BotToast.showText(text: "暂未开放,敬请期待");
            },
          )
        ],
      ),
    );
  }
}
