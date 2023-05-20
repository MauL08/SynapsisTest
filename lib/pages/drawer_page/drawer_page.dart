import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/login_page/login_page.dart';
import 'package:synapsis_test/pages/login_page/login_state.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final LoginState state = Get.put(LoginState());

  @override
  void initState() {
    super.initState();
    state.getDataLoggedUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor2,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            CircleAvatar(
              radius: 54,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.person,
                size: 54,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Obx(
              () => state.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : Text(
                      'Hello, ${state.user}',
                      style: heading1Style.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                state.postLogout();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Logout'),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(Icons.logout),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
