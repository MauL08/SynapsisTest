import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:synapsis_test/core/theme.dart';

class AState {
  RxString phoneInfo = ''.obs;
  RxInt currentBattery = 0.obs;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

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
    if (Platform.isAndroid) {
      var temp = await BatteryInfoPlugin().androidBatteryInfo;
      currentBattery.value = temp!.batteryLevel!.toInt();
    } else {
      var temp = await BatteryInfoPlugin().iosBatteryInfo;
      currentBattery.value = temp!.batteryLevel!.toInt();
    }
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
}
