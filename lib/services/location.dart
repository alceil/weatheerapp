import 'package:geolocator/geolocator.dart';
class location
{
  double latitude;
  double longititude;
  void getcurrentlocation() async{
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}