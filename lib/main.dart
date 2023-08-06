import 'dart:async';

//import 'package:chatgpt_course/screens/animated.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'mindconstants/constants.dart';
import 'mindproviders/chats_provider.dart';
import 'mindproviders/models_provider.dart';
import 'mindscreen/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation growAnimation;
  double height=0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ChatBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              color: cardColor,
            )),
            
        home: WelcomeScreen()
      ),
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
  Timer(Duration(seconds: 5), (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
});
}
}

/*Scaffold(
        body: Center(
        child: Container(
           height: growAnimation.value,
          width: growAnimation.value,
          decoration: BoxDecoration(
             color: Color.fromARGB(255, 229, 212, 212),
             borderRadius: BorderRadius.all(Radius.circular(500)),
             image: DecorationImage(image: AssetImage('assets/images/logo.png'))

          ),
        ),
      ),
      ),*/