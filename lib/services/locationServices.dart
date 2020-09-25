import 'package:geolocator/geolocator.dart';

class LocationServices {
//Geolocator variable
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

// Location in longitude and latitude
  Position currentPosition;

//Location in address form
  String currentAddress;

  String getCurrentAddress() {
    if (currentAddress != null)
      return currentAddress;
    else
      return "/";
  }

//Pin code
  String postalCode;

  String getPinCode() {
    if (postalCode != null)
      return postalCode;
    else
      return "000000";
  }

//Retrieve location from input address
  getLocationfromAddress(address) {
    print(address);
    Geolocator().placemarkFromAddress(address).then((result) {
      print(result[0].position);
    });
  }

//Get location
  getUserLocation() async {
    await getAddressFromLatLng();
  }

//Generate address from coordinates
  getAddressFromLatLng() async {
    try {
      await getCurrentLocation();
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = p[0];
      postalCode = place.postalCode;
      currentAddress =
          "${place.subLocality},${place.locality}, ${place.postalCode}, ${place.country},${place.subAdministrativeArea}";
    } catch (e) {
      print(e);
    }
  }

//Retrieve location in longitude and latitude format
  getCurrentLocation() async {
    try {
      await geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        currentPosition = position;
        // _getAddressFromLatLng();
      }).catchError((e) {
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }
}