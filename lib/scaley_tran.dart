import 'package:flutter/material.dart';

class ScaleTrans extends StatefulWidget {
  @override
  _ScaleTransState createState() => _ScaleTransState();
}

class _ScaleTransState extends State<ScaleTrans>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleTransition;
  // double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    _scaleTransition = Tween<double>(begin: 200, end: 0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffE6E8FD),
        body: RotatedBox(
          quarterTurns: 270,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Icon(Icons.fingerprint, size: 200),
                AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  height: _scaleTransition.value,
                  // color: Colors.red,
                  color: Color(0xffE6E8FD),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Icon(Icons.fingerprint,
                            size: 200, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
