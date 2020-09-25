import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fresh_thinks_practice/shared/stringCollection.dart';

class TermsConditions extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringCollection.title_,
          style: TextStyle(
            fontFamily: 'Cookie',
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(height: size.height * 0.05),
                Container(
                  child: Center(
                    child: Text(
                      StringCollection.termsCondtions,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Container(
                  child: Image(
                      image: AssetImage("assets/Terms_Conditions.png"),
                      width: size.width * 0.6),
                ),
                SizedBox(height: size.height * 0.1),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    StringCollection.heading1,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Center(
                    child: Text(
                      StringCollection.paragraph1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Container(
                  child: Image(
                      image: AssetImage("assets/Terms_Conditions.png"),
                      width: size.width * 0.75),
                ),
                SizedBox(height: size.height * 0.1),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    StringCollection.heading1,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Center(
                    child: Text(
                      StringCollection.paragraph1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.1),
                Container(
                  child: Image(
                      image: AssetImage("assets/Terms_Conditions.png"),
                      width: size.width * 0.75),
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}