import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/scandetail.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  var scanResult = ''.obs;

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      print("scanData.code: "+scanData.code!);
      scanResult.value = scanData.code!;
      Get.toNamed('/result');
    });
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }
}

class ScannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScannerPage();
}

class _ScannerPage extends State<ScannerPage> {
  
  @override
  Widget build(BuildContext context) {
    final QRScannerController controller = Get.put(QRScannerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Expanded(
              child: GetBuilder<QRScannerController>(
                builder: (_) => QRView(
                  key: controller.qrKey,
                  onQRViewCreated: controller.onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Theme.of(context).cardColor,
                    borderRadius: 10,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize: MediaQuery.of(context).size.width * 0.8, 
                    ),
                ),
              ),
            ),
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(scandetailPage());
              },
              child: Text('Scan', style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold, color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
