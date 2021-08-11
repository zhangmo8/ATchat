import 'package:flutter/material.dart';

class LogoAnimated extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationDemo();
}

class _AnimationDemo extends State<LogoAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(seconds: 2),
        lowerBound: 100.0,
        upperBound: 300.0,
        vsync: this);

    _animationController.addListener(() {
      setState(() {});
    });

    print("22222${_animationController.value}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('开始动画'),
            onPressed: () {
              _animationController.forward();
            },
          ),
          Expanded(
            child: Center(
              child: Container(
                width: _animationController.value,
                height: _animationController.value,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
