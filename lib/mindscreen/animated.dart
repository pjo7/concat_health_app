// ignore_for_file: prefer_const_constructors

/*import 'dart:async';

import 'package:chatgpt_course/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation growAnimation;
  double height=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
           height: growAnimation.value,
          width: growAnimation.value,
          decoration: BoxDecoration(
             color: Color.fromARGB(255, 229, 212, 212),
             borderRadius: BorderRadius.all(Radius.circular(500)),
             image: DecorationImage(image: AssetImage('assets/images/logo.png'))
          ),
        ),
           /* Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
           )*/
         ],
       ),
      ),
    );
  }

  startTime() async {
  var duration = new Duration(seconds: 4);
  return new Timer(duration, route);
}
  route() {
  Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => ChatScreen()
    )
  ); 
}

@override
void initState() {
  super.initState();
  controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState((){});
          });
  growAnimation = Tween<double>(begin: 0, end: 200).animate(controller);
  controller.forward();
  startTime();
}
}*/
