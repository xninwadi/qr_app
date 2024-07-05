import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/main.dart';
import 'package:qr_app/widgets/generate.dart';
import 'package:qr_app/widgets/history.dart';
import 'package:qr_app/widgets/scan.dart';

void main() => runApp(const GetMaterialApp(home: homePage()));

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(context) {
    final RxBool isFavoriteChecked = false.obs;
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            const Image(
            image: AssetImage('images/logo.png'),
            width: 200,
            height: 200,
            ),
            const SizedBox(height: 30.0),
            OutlinedButton.icon(
                onPressed: () => Get.to(ScannerPage()), 
                icon: Icon(Icons.qr_code_scanner_outlined, color: Colors.black),
                label: Text('QR Code Scanner'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            const SizedBox(height: 40.0),
            OutlinedButton.icon(
                onPressed: () => Get.to(generatePage()), 
                icon: Icon(Icons.qr_code, color: Colors.black),
                label: Text('QR Code Generator'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            const SizedBox(height: 40.0),
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
            const SizedBox(height: 70.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const goHome()),
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
            /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                    child: const Text("Back", style: TextStyle(fontSize: 15.0),),
                    onPressed: () => Get.to(const goHome()),              
                    ),
                  ],
                ),
              ),*/
          ],),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget{
  NavBar({super.key});

  Widget build(BuildContext context){
    final RxBool isFavoriteChecked = false.obs;
    return Drawer(
      child: Container(
        color: Colors.white,
        
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
           accountName: const Text(""),
           accountEmail: const Text(""),
           currentAccountPicture: CircleAvatar(
            child: ClipOval(child: Image.asset('images/pf1.jpg'),),
           ),
           decoration: BoxDecoration(
            color: Colors.blue,
           ),
           ),
           ListTile(
            leading: Icon(Icons.qr_code_scanner),
            title: Text('QR Scanner'),
            onTap: (){Get.to(ScannerPage());},
           ),
           ListTile(
            leading: Icon(Icons.qr_code),
            title: Text('QR Generator'),
            onTap: (){Get.to(generatePage());},
           ),
           ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: (){Get.to(historyPage(isFavoriteChecked: isFavoriteChecked.value));},
           ),
           ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: (){Get.to(goHome());},
           ),
        ],
      ),
      ),
    );
  }
}