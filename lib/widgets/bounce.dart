import 'package:flutter/material.dart';

// animate ball in a bounce like motion
class BouncingBall extends StatefulWidget {
  _BouncingBallState createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with TickerProviderStateMixin {
  AnimationController _controller;

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 100,
    );

    _controller.addListener(() {
      setState(
        () {},
      );
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: _controller.value),
      child: Image.asset("images/bball.png"),
    );
  }
}
