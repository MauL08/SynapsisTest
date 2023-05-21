import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../data/chart_data.dart';

class CState {
  RxBool isLoading = false.obs;

  RxDouble accelerometerStatusX = RxDouble(0.0);
  RxDouble accelerometerStatusY = RxDouble(0.0);
  RxDouble accelerometerStatusZ = RxDouble(0.0);

  RxDouble gyroStatusX = RxDouble(0.0);
  RxDouble gyroStatusY = RxDouble(0.0);
  RxDouble gyroStatusZ = RxDouble(0.0);

  RxDouble magnetometerStatusX = RxDouble(0.0);
  RxDouble magnetometerStatusY = RxDouble(0.0);
  RxDouble magnetometerStatusZ = RxDouble(0.0);

  List<ChartData> chartDataA = [];
  List<ChartData> chartDataB = [];
  List<ChartData> chartDataC = [];

  void getSensorStatus() {
    isLoading.value = true;
    accelerometerEvents.listen((e) {
      accelerometerStatusX.value = e.x;
      accelerometerStatusY.value = e.y;
      accelerometerStatusZ.value = e.z;

      chartDataA = [
        ChartData(
          id: 1,
          y: e.x,
        ),
        ChartData(
          id: 2,
          y: e.y,
        ),
        ChartData(
          id: 3,
          y: e.z,
        ),
      ];
    });

    gyroscopeEvents.listen((e) {
      gyroStatusX.value = e.x;
      gyroStatusY.value = e.y;
      gyroStatusZ.value = e.z;

      chartDataB = [
        ChartData(
          id: 1,
          y: e.x,
        ),
        ChartData(
          id: 2,
          y: e.y,
        ),
        ChartData(
          id: 3,
          y: e.z,
        ),
      ];
    });

    magnetometerEvents.listen((e) {
      magnetometerStatusX.value = e.x;
      magnetometerStatusY.value = e.y;
      magnetometerStatusZ.value = e.z;

      chartDataC = [
        ChartData(
          id: 1,
          y: e.x,
        ),
        ChartData(
          id: 2,
          y: e.y,
        ),
        ChartData(
          id: 3,
          y: e.z,
        ),
      ];
    });

    isLoading.value = false;
  }
}
