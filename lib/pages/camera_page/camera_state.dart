import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CameraState {
  RxList<CameraDescription> cameras = <CameraDescription>[].obs;
  CameraController cameraController = CameraController(
    const CameraDescription(
      name: '0',
      lensDirection: CameraLensDirection.back,
      sensorOrientation: 90,
    ),
    ResolutionPreset.high,
  );
  RxBool isLoadPict = false.obs;
  RxString imagePath = ''.obs;

  RxDouble magnetometerStatusX = 0.0.obs;
  RxDouble magnetometerStatusY = 0.0.obs;
  RxDouble magnetometerStatusZ = 0.0.obs;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  Future initCamera() async {
    cameras.value = await availableCameras();
    try {
      cameraController = CameraController(cameras[0], ResolutionPreset.high);
      await cameraController.initialize();
    } catch (e) {
      inspect(e);
    }
  }

  Future takePicture(Function() doAfter) async {
    isLoadPict.value = true;
    try {
      await cameraController.setFlashMode(FlashMode.auto);
      XFile pict = await cameraController.takePicture();
      imagePath.value = pict.path;
    } catch (e) {}
    doAfter();
    isLoadPict.value = false;
  }

  void getPosition() async {
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
  }

  void getSensorStatus() {
    magnetometerEvents.listen((e) {
      magnetometerStatusX.value = e.x;
      magnetometerStatusY.value = e.y;
      magnetometerStatusZ.value = e.z;
    });
  }
}
