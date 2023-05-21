import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:synapsis_test/core/theme.dart';
import 'package:synapsis_test/pages/dashboard_page.dart';
import 'package:synapsis_test/pages/login_page/login_state.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

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
            body: SafeArea(
                child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'QR Code Login',
                  style: heading1Style.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            )),
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
              return const DashboardPage();
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
