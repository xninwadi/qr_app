import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/gendetail.dart';
import 'package:qr_app/widgets/generate.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: url(),
    );
  }
}*/

class url extends StatelessWidget {
  final TextEditingController _websiteController = TextEditingController();
  url({super.key});

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
            const Text('Website URL', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 100.0),
            TextField(
              controller: _websiteController,
              decoration: const InputDecoration(
                labelText: 'Enter URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.web),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed:  () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => gendetailPage(_websiteController)),
                );
              },
              child: const Text('Generate', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 200.0),
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       ElevatedButton(
            //         child: const Text("Back", style: TextStyle(fontSize: 15.0),),
            //         onPressed: () => Get.to(const generatePage()),              
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
