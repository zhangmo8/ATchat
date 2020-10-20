import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutterdemo/page/index.dart';

// 去除水波纹
import 'utils/NoSplashFactory.dart';

void main() {
  runApp(MyApp());
  //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
}

class MyApp extends StatelessWidget {
  final ThemeData baseTheme = ThemeData(
    splashFactory: NoSplashFactory(),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SharedPreferences.setMockInitialValues({});
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: BotToastInit(),
        home: MyHomePage(),
        theme: baseTheme);
  }
}
