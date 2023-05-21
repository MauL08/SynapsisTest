import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/login_page/login_page.dart';
import 'package:synapsis_test/pages/login_page/login_state.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

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
            const SizedBox(
              height: 24,
            ),
            CircleAvatar(
              radius: 54,
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.person,
                size: 54,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(
              () => state.isLoadingUser.value
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
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                state.postLogout();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }), (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Row(
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
