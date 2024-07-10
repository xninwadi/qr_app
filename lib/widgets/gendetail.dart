import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/models/myqrcode.dart';
import 'package:qr_app/widgets/history.dart';
import 'package:qr_flutter/qr_flutter.dart';

//void main() => runApp(const GetMaterialApp(home: gendetailPage()));

class gendetailPage extends StatelessWidget {
  
  MyQRCode qrCode = MyQRCode.empty;

  gendetailPage(_qrCode, {super.key}) {
    qrCode = _qrCode;
  }

  @override
  Widget build(context) {
    final RxBool isFavoriteChecked = false.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Column(
          children: <Widget>[ const Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70.0,width: 20.0,),
              Text('QR Code', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            ],),
            const SizedBox(height: 50.0),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100.0),
              if (qrCode.content.isNotEmpty)
              QrImageView(
                  data: qrCode.content,
                  version: QrVersions.auto,
                  size: 300,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Checkbox(
                    value: isFavoriteChecked.value,
                    onChanged: (value) {
                      isFavoriteChecked.value = value!;
                    },
                  )),
                  const Text('Add to favorite', style: TextStyle(fontSize: 20.0)),
              ],
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => historyPage(isFavoriteChecked: isFavoriteChecked.value));
                    },
                    child: const Text(
                      "QR History",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 62, 11, 228),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.black
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }    
}
