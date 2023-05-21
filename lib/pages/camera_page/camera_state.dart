import 'dart:developer';

import 'package:get/get.dart';
import 'package:camera/camera.dart';

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
    } catch (e) {
      e.toString();
    }
    doAfter();
    isLoadPict.value = false;
  }
}
