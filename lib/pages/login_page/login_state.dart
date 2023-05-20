import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:local_auth/local_auth.dart';

class LoginState {
  RxBool isLoading = false.obs;
  RxString user = ''.obs;
  final auth = LocalAuthentication(); // Biometrics

  TextEditingController usernameText = TextEditingController();
  TextEditingController passText = TextEditingController();

  final snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      'Form error, please check again.',
      style: heading2Style.copyWith(
        color: Colors.white,
      ),
    ),
  );

  Future checkBiometrics() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  Future authBio() async {
    final isAvailable = await checkBiometrics();
    if (!isAvailable) return false;

    try {
      return await auth.authenticate(
        localizedReason: 'Scan Fingerprint to Login',
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } on PlatformException {
      return false;
    }
  }

  void postLogin() async {
    isLoading.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', usernameText.value.text);
    usernameText.clear();
    passText.clear();
    isLoading.value = false;
  }

  void getDataLoggedUser() async {
    isLoading.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    user.value = prefs.getString('name') ?? '';
    isLoading.value = false;
  }

  void postLogout() async {
    isLoading.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    usernameText.clear();
    passText.clear();
    isLoading.value = false;
  }
}
