import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/signin_screen.dart';
import 'package:fresh_thinks_practice/screens/signup_screen.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';


//Common class containing Logo displayed on welcome screens
// ignore: must_be_immutable
class LogoContainer extends StatelessWidget {
  Size size;
  LogoContainer(Size size) {
    this.size = size;
  }
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: size.height * 0.12),
      Image.asset(
        "assets/fresh_logo.png",
        fit: BoxFit.fitHeight,
        height: size.height * 0.28,
      ),
      SizedBox(height: size.height * 0.08),
      Transform.scale(
          scale: 1.2,
          // child: Image(
          //   image: AssetImage("assets/Fresh Thinks.png"),
          //   fit: BoxFit.fitWidth,
          //   width: size.width * 0.38,
          // )),
          child: Text(
                  "FreshThinks",
                  style: TextStyle(
                    fontFamily: 'Cookie',
                    fontSize: 45,
                    color: Colors.lightGreen,
                    //fontWeight: FontWeight.bold,

                  ),),)
    ]);
  }
}

//Screen showed after splashscreens
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  Size size;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
    body: SafeArea(
        child: Center(
            child: Column(children: <Widget>[
        LogoContainer(size),
        SizedBox(height: size.height * 0.06),
        Container(
    child: Text(StringCollection.tagLine,
        style: TextStyle(
            color: Colors.grey[500],
            fontSize: 19,
            fontWeight: FontWeight.w500)),
        ),
        SizedBox(height: size.height * 0.14),
        Container(
      width: size.width * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 3.0, spreadRadius: 1.0)
          ],
          color: Colors.white),
      child: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginSignUp()),
                    (r) => false);
              },
              child: InkWell(
                  child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(StringCollection.letsStart,
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ))))),
      ]))));
  }
}

//Screen with Login and Sign Up Button
class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUp createState() => _LoginSignUp();
}

class _LoginSignUp extends State<LoginSignUp> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: <Widget>[
      LogoContainer(size),
      SizedBox(height: size.height * 0.07),
      Container(
          width: size.width * 0.55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 3.0, spreadRadius: 1.0)
              ],
              color: Colors.white),
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignIn.routeName);

                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                      child: Text(StringCollection.loginButton,
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  )))),
      SizedBox(height: size.height * 0.06),
      Container(
          width: size.width * 0.55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 3.0, spreadRadius: 1.0)
              ],
              color: Colors.white),
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignUp.routeName);

                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                      child: Text(StringCollection.signUpButton,
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ))))
    ]))));
  }
}
