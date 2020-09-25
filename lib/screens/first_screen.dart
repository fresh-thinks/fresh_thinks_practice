import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/home_screen.dart';
import 'package:fresh_thinks_practice/screens/splash_screen.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';




class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {





 Timer _timer;

  @override
  void initState() {




    _timer = Timer(Duration(seconds: 3), () {


         FirebaseAuth.instance.onAuthStateChanged.listen((firebaseuser) {

      if (firebaseuser == null) {
        print(firebaseuser);
        Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => SplashScreen()), (r) => false);

      } else {
        setState(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      });



      }

       });


    });
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: StringCollection.title,
        home: Scaffold(
            body: SafeArea(
                child: Center(
                    child: Container(
                        child: Center(
                            child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.2),
            Image.asset(
              "assets/fresh_logo.png",
              fit: BoxFit.fitHeight,
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            Transform.scale(
                scale: 1.2,
                child: Text(
                  "FreshThinks",
                  style: TextStyle(
                    fontFamily: 'Cookie',
                    fontSize: 45,
                    color: Colors.lightGreen,
                    //fontWeight: FontWeight.bold,

                  ),),

            )

          ],
        )))))));
  }
}