import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/callbackRequest.dart';
import 'package:fresh_thinks_practice/shared/stringCollection.dart';

class CustomerService extends StatefulWidget {
  _CustomerService createState() => _CustomerService();
}

class _CustomerService extends State<CustomerService> {
  //Checkbox values
  List<bool> bCheckboxes = [false, false, false, false, false, false];

  //Checkbox labels
  List<String> checkboxLabels = [
    "Delivery",
    "Packing",
    "Quality",
    "Replace",
    "Cashback",
    "Other"
  ];

  //Size of viewport
  Size size;

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
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.fromLTRB(size.width * 0.05, 0, size.width * 0.05, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.025),
                    Container(
                      width: size.width * 0.9,
                      child: Text(
                        StringCollection.customerService,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        StringCollection.complaintsFeedback,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3.0,
                              spreadRadius: 2.5)
                        ],
                        color: Colors.white,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        maxLines: 5,
                        expands: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Write Here.",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      width: size.width * 0.7,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                getCheckboxListItem(size, 0),
                                getCheckboxListItem(size, 1),
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            Row(
                              children: <Widget>[
                                getCheckboxListItem(size, 2),
                                getCheckboxListItem(size, 3),
                              ],
                            ),
                            SizedBox(height: size.height * 0.02),
                            Row(
                              children: <Widget>[
                                getCheckboxListItem(size, 4),
                                getCheckboxListItem(size, 5),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      width: size.width * 0.5,
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
                            onSubmit();
                          },
                          child: InkWell(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(StringCollection.submitComplain,
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
                  ],
                ),
              ),
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
                      ),
                    ),
                    Container(
                      width: size.width * 0.1,
                      child: Center(
                        child: Text(
                          StringCollection.or,
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      color: Colors.white,
                      child: CustomPaint(
                        painter: CurvePainter(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //height: size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Text(
                      StringCollection.requestCall,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 0.4,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CallbackRequest()));
                          },
                          child: InkWell(
                            child: Container(
                              child: Padding(
                                padding: EdgeInsets.all(10),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Each Checkbox Item with label
  Widget getCheckboxListItem(Size size, int index) {
    return Container(
      width: size.width * 0.35,
      child: Row(
        children: <Widget>[
          Container(
              width: size.width * 0.25,
              child:
                  Text(checkboxLabels[index], style: TextStyle(fontSize: 16))),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  bCheckboxes[index] = !bCheckboxes[index];
                },
              );
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1),
                color: getColor(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(index) {
    Color color;
    if (bCheckboxes[index]) {
      color = Colors.black;
    } else
      color = Colors.white;
    return color;
  }

  onSubmit() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ComplaintSubmitted()),
        (r) => false);
  }
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

class ComplaintSubmitted extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fresh Thinks",
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Container(
          child: Column(children: <Widget>[
            SizedBox(height: size.height * 0.2),
            Container(
                //height: size.height * 0.35,
                child: Column(children: <Widget>[
              Container(
                  child: Image(
                image: AssetImage("assets/ComplaintSubmitted.png"),
              )),
              SizedBox(height: size.height * 0.03),
              Container(
                  child: Text(StringCollection.complaintsubmitted_one,
                      style: TextStyle(fontSize: 18))),
              Container(
                  child: Text(StringCollection.complaintsubmitted_two,
                      style: TextStyle(fontSize: 18))),
              Container(
                  child: Image(
                image: AssetImage("assets/Fresh Thinks.png"),
              ))
            ]))
          ]),
        )),
      ),
    );
  }
}