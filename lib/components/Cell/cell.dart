import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellWidget extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final Function onTap;
  const CellWidget({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color(0xff999cb0), width: 2.w)), // 边色与边宽度
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 50.w, color: Color(0xff999cb0)),
              SizedBox(width: 20.w),
              Expanded(child: title),
              SizedBox(width: 20.w),
              Icon(Icons.arrow_forward_ios,
                  size: 30.w, color: Color(0xff999cb0))
            ],
          ),
        ),
      ),
    );
  }
}
