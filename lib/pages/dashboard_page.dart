import 'package:flutter/material.dart';
import 'package:synapsis_test/pages/a_page/a_page.dart';
import 'package:synapsis_test/pages/b_page/b_page.dart';
import 'package:synapsis_test/pages/c_page/c_page.dart';
import 'package:synapsis_test/pages/camera_page/camera_page.dart';
import 'package:synapsis_test/pages/drawer_page/drawer_page.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedItem = 0;

  List<Widget> _pages = [
    APage(),
    BPage(),
    CPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HUHU'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return CameraPage();
              })));
            },
            icon: Icon(Icons.camera_alt_rounded),
          ),
        ],
      ),
      drawer: DrawerPage(),
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: ((value) {
          setState(() {
            _selectedItem = value;
          });
        }),
        items: [
          BottomNavigationBarItem(
            label: 'Page A',
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: 'Page B',
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: 'Page C',
            icon: Icon(Icons.abc),
          )
        ],
      ),
    );
  }
}
