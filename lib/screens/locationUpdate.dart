import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/services/locationServices.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';

class LocationUpdate extends StatefulWidget {
  _LocationUpdate createState() => _LocationUpdate();
}

class _LocationUpdate extends State<LocationUpdate> {
  //Size of Viewport
  Size size;

  //To show or hide the warning message
  bool bWarningMessageVisible = false;

  //Current location of user in address form
  String _currentAddress = "";

  Widget build(BuildContext context) {
    //Get the size of viewport
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
        body: SafeArea(
            child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
                height: size.height * 0.1,
                child: Visibility(
                    visible: false, // bWarningMessageVisible,
                    child: Center(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Container(
                                child: Text(
                                    "We do not deliver to the selected location. We hope to expand soon. Please select another place.",
                                    style: TextStyle(color: Colors.red))))))),
            SizedBox(height: size.height * 0.025),
            Center(
                child: Container(
              width: size.width * 0.6,
              color: Colors.lightGreen,
              child: FlatButton(
                  onPressed: null,
                  child: Row(
                    children: [
                      Container(
                          width: size.width * 0.45,
                          child: Center(
                              child: Text("Get Current Location",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)))),
                      Center(
                          child: Container(
                              width: size.width * 0.05,
                              child: Icon(
                                Icons.my_location,
                                color: Colors.white,
                              ))),
                    ],
                  )),
            )),
            SizedBox(height: size.height * 0.025),
            Container(
              height: size.height * 0.05,
              width: size.width * 0.9,
              child: Row(
                children: [
                  Container(
                      width: size.width * 0.4,
                      color: Colors.white,
                      child: CustomPaint(
                        painter: CurvePainter(),
                      )),
                  Container(
                      width: size.width * 0.1,
                      child: Center(
                          child: Text(
                        StringCollection.or,
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))),
                  Container(
                      width: size.width * 0.4,
                      color: Colors.white,
                      child: CustomPaint(
                        painter: CurvePainter(),
                      )),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Center(
                child: Container(
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.0,
                            spreadRadius: 2.5)
                      ],
                    ),
                    child: FlatButton(
                      child: Text(
                        "Select Address",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: null,
                    ))),
            SizedBox(height: size.height * 0.025),
            Center(
                child: Container(
              width: size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 3.0, spreadRadius: 2.5)
                ],
              ),
              child: TextField(
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  hintText: "Search",
                ),
                onSubmitted: (value) {
                  print(value);
                },
                onTap: () async {},
              ),
            )),
          ]),
        )));
  }

  //Get user's current location
  getUserLocation() {
    LocationServices location = new LocationServices();
    location.getUserLocation();

    String userLocation = location.currentAddress;
    print(userLocation);
  }

  //Pin code verification
  searchandNavigate(String address) {}
}

//To draw Lines
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    var path = Path();

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}