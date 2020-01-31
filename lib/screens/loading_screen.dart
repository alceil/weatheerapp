import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart'

const apiKey='b0b429eedb42a54045f4ae96b69898da';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  double latitude;
  double longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();


  }

  void getlocation() async {
    Location location = location();
    await location.getcurrentlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkhelper=NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherdata = await networkHelper.getdata()
    Navigator.push(context,MaterialPageRoute{
      builder:(context){
        return locationScreen();
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
//double temperature = decodedData['main']['temp'];
//int condition = decodedData['weather'][0]['id'];
//String Cityname = decodedData['name'];
