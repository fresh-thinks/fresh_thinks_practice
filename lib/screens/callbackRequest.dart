import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';

class CallbackRequest extends StatefulWidget {
  _CallbackRequest createState() => _CallbackRequest();
}

class _CallbackRequest extends State<CallbackRequest> {
  //Size of viewport
  Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.12),
                  Image.asset(
                    "assets/Logo.png",
                    fit: BoxFit.fitHeight,
                    height: size.height * 0.28,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    StringCollection.requestCallback,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightGreen, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.lightGreen,
                              blurRadius: 3.0,
                              spreadRadius: 1.0)
                        ],
                        color: Colors.white),
                    height: 50,
                    width: size.width * 0.8,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextField(
                          onSubmitted: (v) {
                            FocusScope.of(context).nextFocus();
                            print('next');
                          },
                          maxLines: 1,
                          textInputAction: TextInputAction.next,
                          decoration:
                              InputDecoration(hintText: 'Enter your name'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightGreen, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.lightGreen,
                              blurRadius: 3.0,
                              spreadRadius: 1.0)
                        ],
                        color: Colors.white),
                    height: 50,
                    width: size.width * 0.8,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Enter your mobile number'),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.07),
                  Container(
                    width: size.width * 0.55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                              spreadRadius: 1.0)
                        ],
                        color: Colors.white),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          validateCallbackRequest();
                        },
                        child: InkWell(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Text(StringCollection.request,
                                  style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.07),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  validateCallbackRequest() {
    setState(
      () {
        bool bValidated = true;

        if (bValidated) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CallbackRequested()));
        } else {}
      },
    );
  }
}

class CallbackRequested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          StringCollection.title_,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.2),
                Image.asset(
                  "assets/PhoneCall.png",
                  fit: BoxFit.fitHeight,
                  height: size.height * 0.3,
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  child: Image(
                    image: AssetImage("assets/Fresh Thinks.png"),
                    fit: BoxFit.fitWidth,
                    width: size.width * 0.38,
                  ),
                ),
                Text(
                  StringCollection.callbackRequested,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}