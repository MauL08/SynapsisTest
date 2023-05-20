import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/dashboard_page.dart';
import 'package:synapsis_test/pages/login_page/login_state.dart';

class QRPage extends StatefulWidget {
  QRPage({Key? key}) : super(key: key);

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  final LoginState state = Get.put(LoginState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 8,
              borderWidth: 6,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: backgroundColor,
              title: Text('QR Code Login'),
            ),
          ),
        ],
      ),
    );
  }

  _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null && scanData.code!.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DashboardPage();
            },
          ),
        );
      }

      state.usernameText.text = 'Anonym';
      state.postLogin();
      ScaffoldMessenger.of(context).showSnackBar(state.snackBarSuccess);
    });
  }

  @override
  dispose() {
    super.dispose();
    controller?.dispose();
  }
}
