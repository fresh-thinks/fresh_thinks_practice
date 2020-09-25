import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_thinks_practice/screens/first_screen.dart';
import 'package:fresh_thinks_practice/screens/home_screen.dart';
import 'package:fresh_thinks_practice/screens/itemList.dart';
import 'package:fresh_thinks_practice/screens/locationCheck.dart';
import 'package:fresh_thinks_practice/screens/profile_screen.dart';
import 'package:fresh_thinks_practice/screens/signin_screen.dart';
import 'package:fresh_thinks_practice/screens/signup_screen.dart';
import 'package:fresh_thinks_practice/screens/test_screen.dart';
import 'package:fresh_thinks_practice/widgets/edit_profile.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _focusNode = new FocusNode();




  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.lightGreen, //or set color with: Color(0xFF0000FF)
));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(_focusNode);
        },

          child: MaterialApp(
          theme: ThemeData(
      primaryColor: Colors.lightGreen,



          ),
          home:HomeScreen(),

          routes: {
            SignUp.routeName : (context) => SignUp(),
            HomeScreen.routeName : (context) => HomeScreen(),
            SignIn.routeName : (context) => SignIn(),







          },



        ),
    );
  }
}

