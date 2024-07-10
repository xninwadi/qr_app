import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/controller/url_controller.dart';
import 'package:qr_app/widgets/gendetail.dart';
import 'package:qr_app/widgets/generate.dart';
import 'package:qr_app/widgets/qr_appbar.dart';

class url extends StatelessWidget {

  final UrlController ctrl = Get.put(UrlController()); 
  url({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildReusableAppBar(),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text('Website URL', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 100.0),
            TextField(
              controller: ctrl.websiteController,
              decoration: const InputDecoration(
                labelText: 'Enter URL',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.web),
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed:  () {
                ctrl.generateQr();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => gendetailPage(ctrl.websiteController)),
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
