import 'package:flutter/material.dart';
import 'package:location_study/data/myLocation.dart';
import 'package:location_study/screen/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../data/network.dart';

const String apiKey = 'caaa563af27cc495aba8882c28c5b356';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude2;
  double? longitude2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    CurrentLocation currentLocation = CurrentLocation();
    await currentLocation.getMyLocation();
    latitude2 = currentLocation.latitude1;
    longitude2 = currentLocation.longitude1;
    print('latitude: $latitude2 / longitude: $longitude2');

    Network network = Network(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apiKey&units=metric',url2: 'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude2&lon=$longitude2&appid=$apiKey');
    var parsedWeatherData = await network.getJsonData();
    var parseAirData=await network.getAirData();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Weather(
              weatherData: parsedWeatherData,airData: parseAirData,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.deepPurple,
          size: 80,
        ),
      ),
    );
  }
}
