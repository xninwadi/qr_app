import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/contact_detail.dart';
import 'package:qr_app/widgets/generate.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: contact(),
    );
  }
}*/

class contact extends StatefulWidget {
  final TextEditingController _Namecontroller ;
  final TextEditingController _Phonecontroller ;
  final TextEditingController _Emailcontroller ;
  final TextEditingController _Addresscontroller ;
  
  const contact(this._Namecontroller,this._Phonecontroller,this._Emailcontroller,this._Addresscontroller, {super.key});
  _contact createState() => _contact();
}

class _contact extends State<contact> {

  String qrCode = "";

  void generateQr() {
    String name = widget._Namecontroller.text;
    String phone = widget._Phonecontroller.text;
    String email = widget._Emailcontroller.text;
    String address = widget._Addresscontroller.text;

    String  qrCode = 'BEGIN:VCARD\n'
                      'VERSION:3.0\n'
                      'FN:${name}\n'
                      'TEL:${phone}\n'
                      'EMAIL:${email}\n'
                      'ADR:${address}\n'
                      'END:VCARD';
    
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => contactDetailPage(qr: qrCode)),
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
              const Text('Contact Information', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
              const SizedBox(height: 40.0),
              TextField(
              controller: widget._Namecontroller,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._Phonecontroller,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._Emailcontroller,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._Addresscontroller,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: generateQr,
              child: const Text('Generate', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 50.0),
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
