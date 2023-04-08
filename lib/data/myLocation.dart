import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  double latitude1=0;
  double longitude1=0;

  Future<void> getMyLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude1=position.latitude;
    longitude1=position.longitude;

    print('latitude: $latitude1 / longitude: $longitude1');
  }
}
