import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart'

const apiKey='b0b429eedb42a54045f4ae96b69898da';

class LoadingScreen extends StatefulWidget {
LocationScreen{ths.locationWeather}

  final locationWeather;


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
     double temp = decodedData['main']['temp'];
     temperature = temp.toint();
     condition = decodedData['weather'][0]['id'];
    Cityname = decodedData['name'];

  }

  void getlocation() async {
    Location location = location();
    await location.getcurrentlocation();
    NetworkHelper networkhelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getdata()
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
