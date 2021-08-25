import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nine_clima/services/weather.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  LocationScreen({this.locationData});
  // Here we create the constructor of Location Screen because we want to take
  // location data from loading screen, so that we can pass that in here.

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weatherModel.getMessage(temperature);

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);

      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(''
                  'images/background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      var weatherData =
                          await weatherModel.getLocationAndItsWeather();
                      updateUI(weatherData);
                    },
                    icon: Icon(
                      Icons.near_me_rounded,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(right: 10, top: 6),
                    onPressed: () async {
                      var typedCityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedCityName != null) {
                        var cityWeatherData = await weatherModel
                            .getCityWeatherData(typedCityName);
                        updateUI(cityWeatherData);
                      }
                    },
                    icon: Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$temperature°', // temperature
                    style: GoogleFonts.balooDa(
                      color: Colors.lightBlue,
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    weatherIcon,
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$weatherMessage in $cityName!',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.play(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
