import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/generate.dart';
import 'package:qr_app/widgets/vCard_detail.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: vCard(),
    );
  }
}*/

class vCard extends StatefulWidget {
  final TextEditingController _NameController;
  final TextEditingController _PhoneController;
  final TextEditingController _EmailController ;
  final TextEditingController _LocationController;
  final TextEditingController _CompanyController;
  
  const vCard(this._NameController,this._PhoneController,this._EmailController,this._LocationController,this._CompanyController, {super.key});
  _vCard createState() => _vCard();
}

class _vCard extends State<vCard> {

  String qrCode = "";

  void generateQr(BuildContext context, String qrCode) {
    String name = widget._NameController.text;
    String phone = widget._PhoneController.text;
    String email = widget._EmailController.text;
    String address = widget._LocationController.text;
    String company = widget._CompanyController.text;

    String  qrCode = 'BEGIN:VCARD\n'
                      'VERSION:3.0\n'
                      'FN:${name}\n'
                      'TEL:${phone}\n'
                      'EMAIL:${email}\n'
                      'ADR:${address}\n'
                      'COM:${company}\n'
                      'END:VCARD';
    

    Navigator.push(context,
      MaterialPageRoute(builder: (context) => vCardDetailPage(qr: qrCode)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              const Text('vCard Information', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 30.0),
              TextField(
              controller: widget._NameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._PhoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._EmailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._LocationController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._CompanyController,
              decoration: const InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home_filled),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                String qrCode = 'Generate';
                generateQr(context, qrCode);
              },
              child: const Text('Generate', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const generatePage()), 
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
