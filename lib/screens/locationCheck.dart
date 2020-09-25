import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_thinks_practice/screens/home_screen.dart';
import 'package:fresh_thinks_practice/screens/locationUpdate.dart';
import 'package:fresh_thinks_practice/services/locationServices.dart';

// ignore: must_be_immutable
class LocationCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Fresh Thinks",
            style: TextStyle(
              fontFamily: 'Cookie',
              fontSize: 30,
            ),
          ),
        ),
        body: SafeArea(
            child: Center(child: Container(child: checkLocations(context)))));
  }

  Widget checkLocations(BuildContext context) {
    checkLocation(context, 5);
    return Text("Checking Location");
  }

  checkLocation(BuildContext context, int retrials) async {
    // Initialize Location Variable
    LocationServices _location = LocationServices();

    //Retrieve the current location of user
    await _location.getUserLocation();

    //Check for the location is deliverable or not.
    if (_location.currentPosition != null) {
      //Print the pincode of location available.
      print(_location.postalCode);
      print(_location.currentAddress);

      if (_location.postalCode != "410206") {
        gotoHomeScreen(context, _location.currentAddress);
      } else {
        gotoLocationSearch(context);
      }
    } else {
      // If location is not received, retry!
      if (retrials > 0) {
        print("NULL $retrials");
        retrials--;
        checkLocation(context, retrials);
      } //If location is not received after number of trials, show message and exit.
      else {
        gotoLocationSearch(context);
      }
    }
  }

//Navigate to Home Screen
  gotoHomeScreen(BuildContext context, String currentAddress) async {
    await Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => HomeScreen()), (r) => false);
  }

//Navigate to Location Search Screen
  gotoLocationSearch(BuildContext context) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LocationUpdate()),
        (r) => false);
  }
}