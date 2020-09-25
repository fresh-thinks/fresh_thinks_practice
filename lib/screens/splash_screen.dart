import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fresh_thinks_practice/screens/welcome_screen.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';


class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  int _currentPageIndex = 0;

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            PageView(
              pageSnapping: true,
              physics: ClampingScrollPhysics(),
              onPageChanged: (index) {
                pageChanged(index);
              },
              children: <Widget>[
                SplashScreenBuilder(StringCollection.splashScreenMessageOne,
                    "assets/SplashOne.png"),
                SplashScreenBuilder(StringCollection.splashScreenMessageTwo,
                    "assets/SplashTwo.jpg"),
                SplashScreenBuilder(StringCollection.splashScreenMessageThree,
                    "assets/SplashThree.jpg"),
              ],
            ),
            Stack(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: DotsIndicator(
                          dotsCount: 3,
                          position: _currentPageIndex.toDouble(),
                          decorator: DotsDecorator(
                            color: Colors.white,
                            activeColor: Colors.green,
                          )),
                    ))
              ],
            ),
            Visibility(
                visible: _currentPageIndex == 2 ? true : false,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton(
                        onPressed: () {
                          gotoWelcomeScreen(context);
                        },
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.lightGreen,
                        shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(26))),
                        child: Icon(Icons.arrow_forward),
                      )),
                ))
          ],
        ),
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  //async because changes to system display settings are being made.
  changeStatusBarColor(
      Color statusbarBackgroundColor, bool bstatusbarForegroundColor) async {
    //set statusbar background color
    await FlutterStatusbarcolor.setStatusBarColor(statusbarBackgroundColor);

    //set icons and text color on status bar: true => white, false => black
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        bstatusbarForegroundColor);
  }

  gotoWelcomeScreen(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()), (r) => false);
  }
}

// ignore: must_be_immutable
class SplashScreenBuilder extends StatelessWidget {
  String _message = "";
  String _assetPath = "";

  SplashScreenBuilder(String message, String assetPath) {
    this._message = message;
    this._assetPath = assetPath;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.lightGreen.withOpacity(0.5), BlendMode.srcOver),
                image: AssetImage(_assetPath),
                fit: BoxFit.cover)),
        child: Padding(

            padding: EdgeInsets.symmetric(vertical: 120.0, horizontal: 50.0),
            child:
            Text(_message,
                style: TextStyle(
                    fontFamily: 'Bradley hand',

                    fontWeight: FontWeight.bold,
                    fontSize: 46,
                    fontStyle: FontStyle.italic,
                    color: Colors.white))));
  }
}
