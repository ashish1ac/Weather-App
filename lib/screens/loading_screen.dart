import 'package:flutter/material.dart';
import 'package:nine_clima/screens/location_screen.dart';
import 'package:nine_clima/services/location.dart';
import 'package:nine_clima/services/networking.dart';
import 'package:nine_clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future getLocationAndData() async {
    var weatherData = await WeatherModel().getLocationAndItsWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationAndData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getLocationAndData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
