import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/components/UserHead/index.dart';

class MessageSession extends StatelessWidget {
  final Map msgDetail;
  const MessageSession({Key key, this.msgDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextDirection direction =
        msgDetail["type"] == "me" ? TextDirection.rtl : TextDirection.ltr;
    final Color bgColor =
        msgDetail["type"] == "me" ? Color(0xff12b7f5) : Color(0xffb7b7b7);

    InlineSpan renderWidget() {
      InlineSpan typeWidget;
      List<InlineSpan> spanChild = [
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: UserHead(
            size: 35,
          ),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: SizedBox(width: 20.w),
        ),
        WidgetSpan(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff686868), width: 1), // 边色与边宽度
              color: bgColor, // 底色
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(msgDetail["msg"]),
          ),
        ),
      ];
      if (msgDetail["type"] == "me") {
        spanChild = [
          WidgetSpan(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Color(0xff686868), width: 1), // 边色与边宽度
                color: bgColor, // 底色
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(msgDetail["msg"]),
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: SizedBox(width: 20.w),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: UserHead(
              size: 35,
            ),
          ),
        ];
      }
      typeWidget = TextSpan(
        text: "",
        style: TextStyle(fontSize: 16, color: Colors.black),
        children: spanChild,
      );
      return typeWidget;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: RichText(
        textDirection: direction,
        text: renderWidget(),
      ),
    );
  }
}

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutterdemo/components/UserHead/index.dart';

// class MessageSession extends StatelessWidget {
//   final Map msgDetail;
//   const MessageSession({Key key, this.msgDetail}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextDirection direction =
//         msgDetail["type"] == "me" ? TextDirection.rtl : TextDirection.ltr;
//     final Color bgColor =
//         msgDetail["type"] == "me" ? Color(0xff12b7f5) : Color(0xffb7b7b7);

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       child: Wrap(
//         crossAxisAlignment: WrapCrossAlignment.center,
//         textDirection: direction,
//         children: [
//           SizedBox(width: 20.w),
// Container(
//   padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
//   decoration: BoxDecoration(
//     border: Border.all(color: Color(0xff686868), width: 1), // 边色与边宽度
//     color: bgColor, // 底色
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//   ),
//   child: RichText(
//     text: TextSpan(
//         text: msgDetail["msg"],
//         style: TextStyle(fontSize: 16, color: Colors.black),
//         children: [
//           WidgetSpan(
//             alignment: PlaceholderAlignment.middle,
//             child: UserHead(
//               size: 35,
//             ),
//           ),
//         ]),
//   ),
// ),
//         ],
//       ),
//     );
//   }
// }
