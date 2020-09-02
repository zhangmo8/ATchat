import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  final Function onTap;
  Search({Key key, this.onTap}) : super(key: key);

  final Color _color = Color(0xFFF5F6F8);
  final Color _fontColor = Colors.grey[300];
  final double _fontSize = 28.w;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(40.w, 20.w, 40.w, 20.w),
        width: 750.w,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            color: _color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: _fontColor,
                size: (_fontSize + 3),
              ),
              SizedBox(width: 10),
              Text(
                "搜索",
                style: TextStyle(color: _fontColor, fontSize: _fontSize),
              )
            ],
          ),
        ));
  }
}
