import 'dart:ui';

import 'package:circular_success_animation/circular_button.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleTransition;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      reverseDuration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleTransition = Tween<double>(begin: 0.5, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {
          _progress = _scaleTransition.value - 0.5;
        });

        if (_progress == 1) {
          _scaleTransition.removeListener(() {});
          _controller.stop();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xffE6E8FD),
          body: Center(
            child: GestureDetector(
              onTapDown: (details) {
                _controller.forward();
              },
              onTapUp: (TapUpDetails details) {
                _controller.reverse();
              },
              child: ScaleTransition(
                  scale: _scaleTransition,
                  child: CircularButton(
                    progress: _progress,
                  )),
            ),
          )),
    );
  }
}
