import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/generate.dart';
import 'package:qr_app/widgets/wifi_detail.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: wifi(),
//     );
//   }
// }

class DropdownController extends GetxController {
  var selectedItem = '  Select type of encryption'.obs;
  var items = ['  Select type of encryption', '  WEP', '  WPA' , '  WPA2-EAP' , '  no pass'].obs;

  void updateSelectedItem(String newValue) {
    selectedItem.value = newValue;
  }
}

class wifi extends StatefulWidget {
  final TextEditingController _netnameController;
  final TextEditingController _passwordController;
  //final TextEditingController _typeController = TextEditingController();
  final DropdownController _typeController;
  const wifi(this._netnameController,this._passwordController,this._typeController, {super.key});

  @override
  _wifi createState() => _wifi();
  }

class _wifi extends State<wifi> {  

  String qrCode = "";

  void generateQr() {
    String ssid = widget._netnameController.text;
    String password = widget._passwordController.text;
    //String encryptionType = widget._typeController.selectedItem.value;

    String  qrCode = 'WIFI:S:${ssid};T:WPA;P:${password};;';
    

    Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyWifiDetailPage(qr: qrCode)),
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
            const Text('WiFi Information', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 50.0),
            TextField(
              controller: widget._netnameController,
              decoration: const InputDecoration(
                labelText: 'Network Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.network_wifi),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: widget._passwordController,
              decoration: const InputDecoration(
                labelText: 'Network Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20.0),
            Obx(() {
              return TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Select an option',
                  suffixIcon: DropdownButtonFormField<String>(
                    value: widget._typeController.selectedItem.value,
                    icon: const Icon(Icons.arrow_downward_outlined),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        widget._typeController.updateSelectedItem(newValue);
                      }
                    },
                    items: widget._typeController.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(),
              );
            }),
            const SizedBox(height: 60.0),
            ElevatedButton(
              onPressed: generateQr,
              child: const Text('Generate', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 100.0),
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
