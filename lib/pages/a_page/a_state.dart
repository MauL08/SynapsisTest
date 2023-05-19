import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:synapsis_test/core/theme.dart';

class AState {
  RxString phoneInfo = ''.obs;
  RxInt currentBattery = 0.obs;

  RxDouble accelerometerStatusX = 0.0.obs;
  RxDouble accelerometerStatusY = 0.0.obs;
  RxDouble accelerometerStatusZ = 0.0.obs;

  RxDouble gyroStatusX = 0.0.obs;
  RxDouble gyroStatusY = 0.0.obs;
  RxDouble gyroStatusZ = 0.0.obs;

  RxDouble magnetometerStatusX = 0.0.obs;
  RxDouble magnetometerStatusY = 0.0.obs;
  RxDouble magnetometerStatusZ = 0.0.obs;

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

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

  Future getDeviceInfo() async {
    if (Platform.isAndroid) {
      var temp = await deviceInfo.androidInfo;
      phoneInfo.value = temp.model;
    } else {
      var temp = await deviceInfo.iosInfo;
      phoneInfo.value = temp.utsname.machine;
    }
  }

  Future getCurrentBattery() async {
    var temp = await BatteryInfoPlugin().androidBatteryInfo;
    currentBattery.value = temp!.batteryLevel!.toInt();
  }

  Widget getCurrentBatteryIcon() {
    if (currentBattery.value == 100) {
      return Icon(
        Icons.battery_full,
        color: backgroundColor,
        size: 72,
      );
    }
    if (currentBattery.value < 80 && currentBattery.value > 40) {
      return Icon(
        Icons.battery_5_bar_rounded,
        color: backgroundColor,
        size: 72,
      );
    }
    if (currentBattery.value < 40 && currentBattery.value > 20) {
      return Icon(
        Icons.battery_4_bar_rounded,
        color: backgroundColor,
        size: 72,
      );
    }
    if (currentBattery.value < 20 && currentBattery.value > 5) {
      return Icon(
        Icons.battery_2_bar_rounded,
        color: backgroundColor,
        size: 72,
      );
    }
    if (currentBattery.value < 5 && currentBattery.value >= 0) {
      return Icon(
        Icons.battery_alert_rounded,
        color: backgroundColor,
        size: 72,
      );
    } else {
      return Container();
    }
  }

  void getSensorStatus() {
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
  }
}
