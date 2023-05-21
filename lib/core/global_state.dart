import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GlobalState {
  RxBool isSensorLoading = false.obs;
  RxBool isMapLoading = false.obs;

  RxDouble accelerometerStatusX = RxDouble(0.0);
  RxDouble accelerometerStatusY = RxDouble(0.0);
  RxDouble accelerometerStatusZ = RxDouble(0.0);

  RxDouble gyroStatusX = RxDouble(0.0);
  RxDouble gyroStatusY = RxDouble(0.0);
  RxDouble gyroStatusZ = RxDouble(0.0);

  RxDouble magnetometerStatusX = RxDouble(0.0);
  RxDouble magnetometerStatusY = RxDouble(0.0);
  RxDouble magnetometerStatusZ = RxDouble(0.0);

  RxDouble latitude = RxDouble(0.0);
  RxDouble longitude = RxDouble(0.0);

  void getPosition() async {
    isMapLoading.value = true;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    isMapLoading.value = false;
  }

  void getSensorStatus() {
    isSensorLoading.value = true;

    accelerometerEvents.listen((e) {
      accelerometerStatusX.value = e.x;
      accelerometerStatusY.value = e.y;
      accelerometerStatusZ.value = e.z;
    });

    gyroscopeEvents.listen((e) {
      gyroStatusX.value = e.x;
      gyroStatusY.value = e.y;
      gyroStatusZ.value = e.z;
    });

    magnetometerEvents.listen((e) {
      magnetometerStatusX.value = e.x;
      magnetometerStatusY.value = e.y;
      magnetometerStatusZ.value = e.z;
    });

    isSensorLoading.value = false;
  }
}
