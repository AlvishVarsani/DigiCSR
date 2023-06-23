import 'package:flutter/material.dart';

class Animated_Notification_Icon extends StatefulWidget{
  @override
  State<Animated_Notification_Icon> createState() => _Animated_Notification_IconState();
}

class _Animated_Notification_IconState extends State<Animated_Notification_Icon> with SingleTickerProviderStateMixin  {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  void _runAnimation() async {
    for (int i = 0; i < 3; i++) {
      await _animationController!.forward();
      await _animationController!.reverse();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotationTransition(
                turns: Tween(begin: 0.0, end: -.1)
                    .chain(CurveTween(curve: Curves.elasticIn))
                    .animate(_animationController!),
                child: Icon(Icons.alarm)),
            TextButton(
              child: Text('Run Animation'),
              onPressed: () => _runAnimation(),
            )
          ],
        ),
      ),
    );
  }
}