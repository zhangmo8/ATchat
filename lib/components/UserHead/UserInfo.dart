import 'package:barcode_scan/barcode_scan.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutterdemo/components/Cell/cell.dart';
import 'index.dart';

class UserInfo {
  static TextStyle fontColor({double size = 35, bool bold = false}) {
    return TextStyle(
        color: Colors.white,
        fontSize: size.w,
        fontWeight: bold ? FontWeight.normal : FontWeight.w300);
  }

  static get drawer => Drawer(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.h,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.network(
                        "https://img95.699pic.com/photo/40100/6015.jpg_wh300.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 200.0.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10.w),
                            UserHead(
                              size: 50.0,
                              onTap: () {
                                print("点击了头像");
                              },
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("在难搞的日子里笑出声",
                                        style: fontColor(bold: true)),
                                    SizedBox(height: 5.0),
                                    Text("不知苦楚  莫问前程",
                                        style: fontColor(size: 30)),
                                  ],
                                ),
                                onTap: () {
                                  print("点击详情");
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.center_focus_weak,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print("点击二维码");
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0.h),
              ...userCell()
            ],
          ),
        ),
      );

  static get userHead => Builder(
        builder: (context) => UserHead(
          onTap: () => Scaffold.of(context).openDrawer(),
        ),
      );

  static Future scan() async {
    try {
      // 此处为扫码结果，barcode为二维码的内容
      String barcode = await BarcodeScanner.scan();
      print('扫码结果: ' + barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        // 未授予APP相机权限
        print('未授予APP相机权限');
      } else {
        // 扫码错误
        print('扫码错误: $e');
      }
    } on FormatException {
      // 进入扫码页面后未扫码就返回
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      // 扫码错误
      print('扫码错误: $e');
    }
  }

  static Widget popMenu() {
    return Container(
      width: 30,
      height: 30,
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        icon: Icon(Icons.add),
        //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
        onSelected: (String value) {
          print("111    $value");
          switch (value) {
            case "sweep":
              scan();
              break;
            default:
          }
        },
        //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Icon(Icons.person), Text('加好友')],
            ),
            value: 'add',
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Icon(Icons.select_all), Text('扫一扫')],
            ),
            value: 'sweep',
          ),
        ],
      ),
    );
  }

  static List<Widget> userCell() {
    List mainCell = [
      {"icon": Icons.account_balance_wallet, "name": "钱包"},
      {"icon": Icons.archive, "name": "文件管理"},
      {"icon": Icons.book, "name": "收藏"},
      {"icon": Icons.settings, "name": "设置"},
    ];

    return mainCell
        .map((e) => CellWidget(
            icon: e["icon"],
            title: Text(e["name"]),
            onTap: () {
              BotToast.showText(text: e["name"]);
            }))
        .toList();
  }
}
