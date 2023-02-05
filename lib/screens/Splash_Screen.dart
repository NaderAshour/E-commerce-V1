import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/body.dart';

import 'LoginScreen/Login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  AnimationController? controller;
  void initState() {
   controller =AnimationController(vsync: this,duration: Duration(seconds: 3));
    super.initState();
    Timer(Duration(milliseconds: 3500),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    LoginScreen()
            )
        )
    );
    controller!.forward();
  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors: [Colors.white,Colors.white10]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 300,
                height: 300,
                child: Lottie.asset(
                "assets/lottie/supermarket.json",
                  controller: controller,
                  animate: true,



            ),
              ),
                 Text(" We Are In Your Service,All time",textAlign:TextAlign.center,
                   style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                 ),

              CircularProgressIndicator(
                valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}