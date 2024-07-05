import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/history.dart';
import 'package:qr_app/widgets/home.dart';
import 'package:qr_app/widgets/scandetail.dart';

void main() => runApp(const GetMaterialApp(home: scanPage()));

class scanPage extends StatelessWidget {
  const scanPage({super.key});
  
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
          children: <Widget>[const Row(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70.0,width: 20.0,),
            Text('Scan QR Code', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            ],),
            const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0,),
              
              
              
              ],
            ),
            const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0,),
              Text('Align QR code within frame to scan', 
                style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
              ),
            ],),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 60.0,),
              ElevatedButton(
                style: ButtonStyle(minimumSize: WidgetStateProperty.all(const Size(100, 50)),),
                child: const Text("Scan", style: TextStyle(fontSize: 15.0 , fontWeight: FontWeight.bold, color: Colors.black),),
                 onPressed: () => Get.to(scandetailPage()),              
              ),
              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0,width: 20.0,),
              GestureDetector(
              onTap: (){
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
                ),),
              ),
            ],),
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text("Back", style: TextStyle(fontSize: 15.0),),
                    onPressed: () => Get.to(const homePage()),              
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