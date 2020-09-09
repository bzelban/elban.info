import 'package:flutter/material.dart';
import 'dart:async';
import 'package:elban/landing.dart';

void main() {
  runApp(
    MaterialApp(
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
      title: 'Bedirhan .Z ELBAN',
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        accentColor: Colors.black,
        dividerColor: Colors.black,
      ),
    ),
  );
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  Image imageWiggle;

  @override
  void initState() {
    super.initState();
    imageWiggle = Image.asset("assets/wiggle.gif");

    Future.delayed(
      Duration(milliseconds: 400),
      () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return MyApp();
            },
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(imageWiggle.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: new Image.asset(
          'assets/code.png',
          scale: 1,
        ),
      ),
    );
  }
}
