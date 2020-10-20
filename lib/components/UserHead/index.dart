import 'package:flutter/material.dart';

class UserHead extends StatelessWidget {
  final double size;
  final Function onTap;
  const UserHead({Key key, this.size = 30, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        child: InkWell(
            onTap: () {
              onTap();
            },
            child: CircleAvatar(
              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
              backgroundImage: NetworkImage(
                  'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
            )));
  }
}
