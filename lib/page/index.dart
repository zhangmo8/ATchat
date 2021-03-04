import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
// pages
import 'Friends/index.dart';
import 'Login/index.dart';
import 'Message/index.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  void _onItemTapped(int i) {
    _controller.jumpToPage(i);
    this.setState(() {
      this._selectedIndex = i;
    });
  }

  @override
  void initState() {
    // checkToken();
    super.initState();
  }

  checkToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? "");
    if (token != "" && token.length > 0) {
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MessagePage()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: [MessagePage(), FriendsPage()]),
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.textsms), label: '消息'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '好友'),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
