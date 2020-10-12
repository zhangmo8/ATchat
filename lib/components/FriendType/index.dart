import 'package:flutter/material.dart';

class FriendTypes extends StatelessWidget {
  const FriendTypes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
          decoration: UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
          ),
          child: Text("分类列表")),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: new EdgeInsets.only(bottom: 20.0),
//       height: 100.0.h,
//       child: new ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           new Container(
//             width: 160.0.w,
//             color: Colors.red,
//           ),
//           new Container(
//             width: 160.0.w,
//             color: Colors.blue,
//           ),
//           new Container(
//             width: 160.0.w,
//             color: Colors.green,
//           ),
//           new Container(
//             width: 160.0.w,
//             color: Colors.yellow,
//           ),
//           new Container(
//             width: 160.0.w,
//             color: Colors.orange,
//           ),
//         ],
//       ),
//     );
//   }
