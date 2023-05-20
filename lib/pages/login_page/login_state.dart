import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis_test/core/theme.dart';

class LoginState {
  RxBool isLoading = false.obs;
  RxString user = ''.obs;

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
    isLoading.value = false;
  }
}
