// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lastpractice.dart';
import 'package:flutter_application_1/secondpractice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isfav = false;
  late AnimationController _controller;

  late Animation _color;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    _color =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _controller.addStatusListener((status) {});
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          isfav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LastPractice(),
      // home: Scaffold(
      //   body: Center(
      //     child: Container(
      //       height: 300,
      //       width: 500,
      //       child: IconButton(
      //           onPressed: () {
      //             isfav ? _controller.reverse() : _controller.forward();
      //           },
      //           icon: Icon(
      //             CupertinoIcons.heart_circle_fill,
      //             size: 56,
      //             color: _color.value,
      //           )),
      //     ),
      //   ),
      // ),
    );
  }
}
