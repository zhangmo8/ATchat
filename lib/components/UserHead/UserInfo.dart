import 'package:flutter/material.dart';

import 'index.dart';

class UserInfo {
  static get drawer => Drawer(
        child: Text('This is Drawer'),
      );

  static get userHead => Builder(
      builder: (context) => UserHead(
            onTap: () => Scaffold.of(context).openDrawer(),
          ));

  static void addFriend() {
    print("加好友");
  }
}
