import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:location_study/model/model.dart';

class Weather extends StatefulWidget {
  Weather({required this.weatherData, required this.airData, Key? key})
      : super(key: key);

  dynamic weatherData;
  dynamic airData;

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Model model = Model();
  String? cityName;
  int? temp;
  int? condition;
  Widget? weatherIcon;
  String? weatherCondition;

  int? airCondition;
  Widget? airIcon;
  double? dust;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputData(widget.weatherData, widget.airData);
  }

  void inputData(dynamic weatherData, dynamic airData) {
    cityName = weatherData['name'];
    double temp2 = weatherData['main']['temp'];
    temp = temp2.toInt();
    condition = weatherData['weather'][0]['id'];
    weatherIcon = model.WeatherIcon(condition!);
    weatherCondition = weatherData['weather'][0]['description'];

    airCondition = airData['list'][0]['main']['aqi'];
    airIcon = model.AirIcon(airCondition!);
    dust=airData['list'][0]['components']['pm10'];
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat('h:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.near_me)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.location_searching))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      Text(
                        '$cityName',
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimerBuilder.periodic(
                            const Duration(minutes: 1),
                            builder: (context) {
                              return Text(
                                getSystemTime(),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              );
                            },
                          ),
                          Text(
                            DateFormat('- EEEE').format(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            DateFormat(' MM/dd').format(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$temp \u2103',
                        style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          weatherIcon!,
                          Text(
                            '$weatherCondition',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 180,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Divider(
                    height: 40,
                    thickness: 4,
                    color: Colors.deepPurple,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'pollution',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        airIcon!,
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          model.AirCondition(airCondition!),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: airCondition! >= 3
                                  ? Colors.black54
                                  : Colors.redAccent),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Dust',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '$dust',
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                       const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          '㎍/㎥',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
