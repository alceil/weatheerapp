import 'package:flutter/material.dart';
import 'location_screen.dart'

class LoadingScreen extends StatefulWidget {
LocationScreen{ths.locationWeather}

  final locationWeather;


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weather=WeatherModel();
  int temperature ;
  int condition ;
  String Cityname;

  double latitude;
  double longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    setState(() {

    if (weatherData == null)
      {
        temperature=0;
        WeatherIcon='error';
        Weathermessage = "Unable to get weather Data"

      }
     double temp = decodedData['main']['temp'];
    var temperature = temp.toint();
    var  condition = decodedData['weather'][0]['id'];
    Cityname = decodedData['name'];
    Weathericon=weather.getWeatherIcon(condition);
     Weathermessage=weather.getWeathermessage(temperature);
    });
  }

  void getlocation() async {
    var weatherdata =  await weathermodel().getlocationWeather();
    Navigator.push(context,MaterialPageRoute{
      builder:(context){
        return locationScreen(locationWeather:weatherdata,);
    }));

  }


 }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        );
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
