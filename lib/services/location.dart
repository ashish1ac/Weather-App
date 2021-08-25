import 'package:geolocator/geolocator.dart';

class Location {
  double? getLatitude; // 10
  double? getLongitude; // 20

  Future getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    getLatitude = position.latitude; //getLatitude = 10;
    getLongitude = position.longitude; //getLongitude = 20;
  }
}
