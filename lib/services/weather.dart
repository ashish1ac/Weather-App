import 'package:nine_clima/services/location.dart';
import 'package:nine_clima/services/networking.dart';

const kAPIKey = '1c2c0685ccd7cb12e2a9f96ab664fc69';
const kOpenWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    var url = Uri.parse(
        'api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kAPIKey');

    NetworkHelper networkHelper = NetworkHelper(url: 'url');
    var cityWeatherData = await networkHelper.getDataFromServer();
    print(cityWeatherData);
    return cityWeatherData;
  }

  Future<dynamic> getLocationAndItsWeather() async {
    Location locationObj = new Location(); // Location class Object
    await locationObj.getCurrentLocation(); // Call method

    NetworkHelper networkHelper = NetworkHelper(
        url: '$kOpenWeatherURL?lat=${locationObj.getLatitude}&'
            'lon=${locationObj.getLongitude}&appid=$kAPIKey&units=metric');

    var weatherData = await networkHelper.getDataFromServer();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300)
      return '🌩';
    else if (condition < 400)
      return '🌧';
    else if (condition < 600)
      return '☔️';
    else if (condition < 700)
      return '☃️';
    else if (condition < 800)
      return '🌫';
    else if (condition == 800)
      return '☀️';
    else if (condition <= 804)
      return '☁️';
    else
      return '🤷‍';
  }

  String getMessage(int temp) {
    if (temp > 25)
      return 'It\'s 🍦 time';
    else if (temp > 20)
      return 'Time for shorts and 👕';
    else if (temp < 10)
      return 'You\'ll need 🧣 and 🧤';
    else
      return 'Bring a 🧥 just in case';
  }
}
