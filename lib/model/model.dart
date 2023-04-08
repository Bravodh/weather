import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Model {
  Widget WeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset('svg/climacon-cloud_lightning.svg');
    } else if (condition < 500) {
      return SvgPicture.asset('svg/climacon-cloud_moon.svg');
    } else if (condition < 600) {
      return SvgPicture.asset('svg/climacon-cloud_rain.svg');
    } else if (condition < 700) {
      return SvgPicture.asset('svg/climacon-cloud_snow.svg');
    } else if (condition == 800) {
      return SvgPicture.asset('svg/climacon-sun.svg');
    } else {
      return SvgPicture.asset('svg/climacon-sun_fill.svg');
    }
  }

  String WeatherConditon(int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 500) {
      return 'Dirzzle';
    } else if (condition < 600) {
      return 'Rain';
    } else if (condition < 700) {
      return 'Snow';
    } else if (condition == 800) {
      return 'Atmosphere';
    } else {
      return 'Clear';
    }
  }

  Widget AirIcon(int index) {
    double h = 35;
    double w = 35;

    switch (index) {
      case 1:
        return Image.asset(
          'images/good.png',
          height: h,
          width: w,
        );
      case 2:
        return Image.asset(
          'images/fair.png',
          height: h,
          width: w,
        );
      case 3:
        return Image.asset(
          'images/moderate.png',
          height: h,
          width: w,
        );
      case 4:
        return Image.asset(
          'images/poor.png',
          height: h,
          width: w,
        );
      default:
        return Image.asset(
          'images/very_poor.png',
          height: h,
          width: w,
        );
    }
  }

  String AirCondition(int index) {
    switch (index) {
      case 1:
        return 'Good';
      case 2:
        return 'Fair';
      case 3:
        return 'Moderate';
      case 4:
        return 'Poor';
      default:
        return 'Very Poor';
    }
  }
}
