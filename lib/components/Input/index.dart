import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final double width;
  final Icon icon;
  final String suffixText;
  final String errorText;
  final String helperText;
  Input(
      {Key key,
      this.placeholder,
      this.width,
      this.icon,
      this.suffixText,
      this.errorText,
      this.helperText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholder ?? "",
          icon: icon,
          suffixText: suffixText,
          errorText: errorText,
          helperText: helperText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]),
          ),
        ),
      ),
    );
  }
}
