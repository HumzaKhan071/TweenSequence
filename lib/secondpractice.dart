import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPractice extends StatefulWidget {
  const SecondPractice({Key? key}) : super(key: key);

  @override
  _SecondPracticeState createState() => _SecondPracticeState();
}

class _SecondPracticeState extends State<SecondPractice>
    with SingleTickerProviderStateMixin {
  bool isfav = false;

  late AnimationController _animationController;
  late Animation _color;
  late Animation<double> _sizeanimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _color = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);
    _sizeanimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_animationController);
    _animationController.addStatusListener((status) {
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
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 600,
            width: 500,
            color: Colors.teal,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return IconButton(
                  onPressed: () {
                    isfav
                        ? _animationController.reverse()
                        : _animationController.forward();
                  },
                  icon: Icon(CupertinoIcons.heart_circle_fill),
                  iconSize: _sizeanimation.value,
                  color: _color.value,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
