import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/home.dart';
import 'package:qr_app/widgets/scan.dart';

//void main() => runApp(const GetMaterialApp(home: scandetailPage()));

class scandetailPage extends StatelessWidget {
  scandetailPage({super.key});
  final QRScannerController controller = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Column(
          children: <Widget>[const Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70.0,width: 20.0,),
            Text('Scanned Result', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            ],),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100.0,),
                GetBuilder<QRScannerController>(
                  builder: (_) => Text(controller.scanResult.value),
                ),
              ],
            ),
            const SizedBox(height: 100.0),
             SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 1, 41, 61)),
                    child: const Text("Copy", style: TextStyle(fontSize: 15.0,color: Colors.white),),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: controller.scanResult.value));
                    },              
                  ),
              ),
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const homePage()),
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