import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// components
import 'package:flutterdemo/components/Input/index.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 750.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Image(
                height: 100,
                width: 100,
                image: AssetImage("assets/images/logo.jpeg"),
              ),
              Input(
                icon: Icon(Icons.phone),
                placeholder: "请输入手机号",
                width: 650,
              ),
              Input(
                icon: Icon(Icons.remove_red_eye),
                placeholder: "请输入密码",
                width: 650,
                helperText: "密码应为至少6位数的字符",
              ),
              RaisedButton(
                  onPressed: () {
                    print("登录");
                  },
                  child: Text("登录")),
              OutlineButton(onPressed: (){
                print("注册");
              }, child: Text("注册"))
            ],
          )),
    );
  }
}
