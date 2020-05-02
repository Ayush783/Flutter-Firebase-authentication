import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_app/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  startTime() async{
    var _duration=Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.of(context).pushReplacementNamed('/AuthWidget');
  }

  AnimationController _controller;
  Animation<Color>    animation1;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation1 =ColorTween(begin: Colors.blue,end: Colors.red).animate(_controller);
    startTime();

    _controller.forward();
    _controller.addListener((){
      if(_controller.status==AnimationStatus.completed)
        _controller.reverse();
      else if(_controller.status==AnimationStatus.dismissed)
        _controller.forward();
      this.setState((){});
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Loading...",style: ktextstyle1.copyWith(fontSize:30,color: animation1.value),
          ),
        ),),
    );
  }
}
