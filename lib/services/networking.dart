import 'package:http/http.dart' as http;
import 'dart:convert';

class networkHelper {
  networkhelper(this.url)
  final String url;

  Future <void> getData() async
  {
    http.Response response = await http.get(url),
    if(response.statuscode==200)
    {
    String data=response.body;
    var decodedData = jsonDecode(data);
    return decodedData;
    else
    {
    print(response.statuscode)
    }
    }
  }
}