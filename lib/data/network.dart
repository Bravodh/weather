import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  String url,url2;

  Network({required this.url,required this.url2});

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var parseData = jsonDecode(response.body);
      print('weatherData: ${response.body}');
      return parseData;
    } else {
      return print(response.statusCode);
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));

    if (response.statusCode == 200) {
      var parseData = jsonDecode(response.body);
      print('airData: ${response.body}');
      return parseData;
    } else {
      return print(response.statusCode);
    }
  }
}
