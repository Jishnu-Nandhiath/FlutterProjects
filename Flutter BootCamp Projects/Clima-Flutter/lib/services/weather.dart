import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'use your api key in here';
//for generating api keys you have to sign up in openweathermap API and use that given api key in here
const openWeatherMapAPIURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkConnector connector = NetworkConnector(
        '$openWeatherMapAPIURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await connector.getData();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkConnector connector = NetworkConnector(
        '$openWeatherMapAPIURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await connector.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
