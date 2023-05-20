import 'package:flutter/material.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/login_page/login_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

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
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Hello, USER',
              style: heading1Style.copyWith(
                color: secondaryColor,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
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
