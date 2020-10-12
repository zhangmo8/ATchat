import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/components/UserHead/index.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';

class MessageItem extends StatelessWidget {
  final Map itemData;
  const MessageItem({Key key, @required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 750.w,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            UserHead(size: 100.w),
            SizedBox(width: 20.w),
            OtherInfo(otherName: "就是这个字")
          ],
        ));
  }
}

class OtherInfo extends StatelessWidget {
  final String otherName;
  final String message;
  OtherInfo({Key key, @required this.otherName, this.message = "一条消息"})
      : super(key: key);
  final Color _messageColor = Color(0xFF838488);
  final double _fontSize = 32.w;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$otherName",
          style: TextStyle(fontSize: _fontSize),
        ),
        Text(
          "$message",
          style: TextStyle(color: _messageColor, fontSize: (_fontSize - 3)),
        ),
      ],
    )));
  }
}

class MessageItemTile {
  static tileBuild(Map item, int i) {
    return CupertinoLeftScroll(
      bounce: true,
      key: Key('massageList$i'),
      closeTag: LeftScrollCloseTag('tag'),
      child: ListTile(
        onTap: () {
            BotToast.showText(text: "dial    $item");
          print("diale    $item");
        },
        leading: UserHead(size: 40),
        title: Text("${item["name"]}"),
        subtitle: Text(
          "${item["message"]}",
          style: TextStyle(fontSize: 26.w),
        ),
      ),
      buttons: [
        LeftScrollItem(
          text: '置顶',
          color: Colors.orange,
          onTap: () {
            BotToast.showText(text: "edit");
          },
        ),
        LeftScrollItem(
          text: '删除',
          color: Colors.red,
          onTap: () {
            BotToast.showText(text: "删除");
            LeftScrollGlobalListener.instance
                .targetStatus(LeftScrollCloseTag("tag"), Key('massageList$i'))
                .value = false;
          },
        ),
      ],
    );
  }
}

// // 自定义列表
// _listBuild(i) {
//   final e = massageList[i];
//   return CupertinoLeftScroll(
//     bounce: true,
//     key: Key('massageList$i'),
//     closeTag: LeftScrollCloseTag('TODO: your tag'),
//     buttonWidth: 80,
//     child: MessageItem(
//       itemData: e,
//     ),
//     buttons: [
//       LeftScrollItem(
//         text: 'edit',
//         color: Colors.orange,
//         onTap: () {
//           print('edit');
//         },
//       ),
//       LeftScrollItem(
//         text: 'delete',
//         color: Colors.red,
//         onTap: () {
//           print('delete');
//         },
//       ),
//     ],
//   );
// }
