import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';

const apiKey='b0b429eedb42a54045f4ae96b69898da';
const openweatherurl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future <dynamic> getlocationweathter() async{
    Location location = location();
    await location.getcurrentlocation();
    NetworkHelper networkhelper=NetworkHelper('$openweatherurl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getdata();
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
