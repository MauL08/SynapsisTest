import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/pages/camera_page/camera_state.dart';
import 'package:synapsis_test/pages/dashboard_page.dart';
import 'package:synapsis_test/pages/login_page/login_page.dart';
import 'package:synapsis_test/pages/splash_page/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CameraState camState = Get.put(CameraState());
  camState.initCamera();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Synapsis Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
