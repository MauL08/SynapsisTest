import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/dashboard_page.dart';
import 'package:synapsis_test/pages/login_page/login_state.dart';
import 'package:synapsis_test/widget/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginState state = Get.put(LoginState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'Synapsis.id Challenge',
                style: heading1Style.copyWith(
                  fontSize: 32,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                controller: state.usernameText,
                hint: 'Username',
                prefixSection: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFieldWidget(
                controller: state.passText,
                hint: 'Password',
                prefixSection: Icon(
                  Icons.lock,
                  color: primaryColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return DashboardPage();
                  }), (route) => false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Login'),
                    SizedBox(width: 8),
                    Icon(
                      Icons.login,
                      color: secondaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor2,
                      padding: pagePadding,
                    ),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.fingerprint,
                          size: 48,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Login with Fingerprint',
                          style: heading2Style.copyWith(
                            fontSize: 14,
                            color: secondaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor2,
                      padding: pagePadding,
                    ),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.qr_code,
                          size: 48,
                          color: secondaryColor,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Login with QR Code',
                          style: heading2Style.copyWith(
                            fontSize: 14,
                            color: secondaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
