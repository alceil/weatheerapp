import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
    getData();

  }

  void getlocation() async {
    Location location = location();
    await location.getcurrentlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getData();
 }
 void getData() async{
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'),
    if(response.statuscode==200)
   {
   String data=response.body;
   var decodedData = jsonDecode(data);
   double temperature = decodedData['main']['temp'];
   int condition = decodedData['weather'][0]['id'];
   String Cityname = decodedData['name'];
   print('temperature');
   print('condition');
   print('Cityname');
   }
   else
     {
       print(response.statuscode)
     }
   }

 }


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
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
