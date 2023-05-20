import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:synapsis_test/core/db_function.dart';

class BState {
  RxBool isLoadingPhoneData = false.obs;

  RxMap<String, dynamic> deviceData = <String, dynamic>{}.obs;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  RxString buildNumber = ''.obs;
  RxString versionCode = ''.obs;

  TextEditingController inputText = TextEditingController();

  RxBool isLoadingData = false.obs;
  RxList dataList = List.empty().obs;
  RxMap<String, dynamic> detailData = <String, dynamic>{}.obs;

  void initPhoneBuildData() async {
    isLoadingPhoneData.value = true;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    buildNumber.value = packageInfo.version;
    versionCode.value = packageInfo.buildNumber;
    try {
      if (Platform.isAndroid) {
        deviceData.value =
            fetchAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else {
        deviceData.value = fetchIOSBuildData(await deviceInfoPlugin.iosInfo);
      }
    } catch (e) {
      inspect(e);
    }
    isLoadingPhoneData.value = false;
  }

  Map<String, dynamic> fetchAndroidBuildData(data) {
    return <String, dynamic>{
      'version.securityPatch': data.version.securityPatch,
      'version.sdkInt': data.version.sdkInt,
      'version.release': data.version.release,
      'version.previewSdkInt': data.version.previewSdkInt,
      'version.incremental': data.version.incremental,
      'version.codename': data.version.codename,
      'version.baseOS': data.version.baseOS,
      'board': data.board,
      'bootloader': data.bootloader,
      'brand': data.brand,
      'device': data.device,
      'display': data.display,
      'fingerprint': data.fingerprint,
      'hardware': data.hardware,
      'host': data.host,
      'id': data.id,
      'manufacturer': data.manufacturer,
      'model': data.model,
      'product': data.product,
      'supported32BitAbis': data.supported32BitAbis,
      'supported64BitAbis': data.supported64BitAbis,
      'supportedAbis': data.supportedAbis,
      'tags': data.tags,
      'type': data.type,
      'isPhysicalDevice': data.isPhysicalDevice,
      'systemFeatures': data.systemFeatures,
      'displaySizeInches':
          ((data.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': data.displayMetrics.widthPx,
      'displayWidthInches': data.displayMetrics.widthInches,
      'displayHeightPixels': data.displayMetrics.heightPx,
      'displayHeightInches': data.displayMetrics.heightInches,
      'displayXDpi': data.displayMetrics.xDpi,
      'displayYDpi': data.displayMetrics.yDpi,
      'serialNumber': data.serialNumber,
    };
  }

  Map<String, dynamic> fetchIOSBuildData(data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Future getAll() async {
    isLoadingData.value = true;
    dataList.value = await DBFunction.getAllData();
    isLoadingData.value = false;
  }

  Future getById(int id) async {
    isLoadingData.value = true;
    var temp = await DBFunction.getDataById(id);
    inputText.text = temp[0]['title'];
    isLoadingData.value = false;
  }

  Future add() async {
    isLoadingData.value = true;
    await DBFunction.postData(
      inputText.text,
      DateFormat.yMMMMEEEEd().format(DateTime.now()),
    );
    inputText.clear();
    isLoadingData.value = false;
  }

  Future update(int id) async {
    isLoadingData.value = true;
    await DBFunction.updateData(
      id,
      inputText.text,
      DateFormat.yMMMMEEEEd().format(DateTime.now()),
    );
    inputText.clear();
    isLoadingData.value = false;
  }

  Future delete(int id) async {
    isLoadingData.value = true;
    await DBFunction.deleteData(id);
    isLoadingData.value = false;
  }
}
