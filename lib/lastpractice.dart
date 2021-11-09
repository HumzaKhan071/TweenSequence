import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LastPractice extends StatefulWidget {
  const LastPractice({Key? key}) : super(key: key);

  @override
  _LastPracticeState createState() => _LastPracticeState();
}

class _LastPracticeState extends State<LastPractice>
    with SingleTickerProviderStateMixin {
  late AnimationController _contoller;

  late Animation _color;
  late Animation<double> _size;
  late Animation<double> _curve;

  bool isfav = false;

  @override
  void initState() {
    super.initState();

    _contoller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _curve = CurvedAnimation(parent: _contoller, curve: Curves.easeIn);

    _size = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(_curve);

    _color = ColorTween(begin: Colors.grey, end: Colors.red).animate(_curve);

    _contoller.addListener(() {});
    _contoller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isfav = true;
      }
      if (status == AnimationStatus.dismissed) {
        isfav = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _contoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _contoller,
            builder: (context, _) {
              return Container(
                height: 500,
                width: 500,
                color: Colors.yellow,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          isfav ? _contoller.reverse() : _contoller.forward();
                        },
                        icon: Icon(
                          CupertinoIcons.heart_circle_fill,
                          color: _color.value,
                          size: _size.value,
                        )),
                    TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        curve: Curves.easeInBack,
                        duration: Duration(milliseconds: 1000),
                        builder: (context, double _val, child) {
                          return Opacity(
                            opacity: _val,
                            child: Padding(
                              padding: EdgeInsets.all(_val * 50),
                              child: Text("Humza Khan"),
                            ),
                          );
                        })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
