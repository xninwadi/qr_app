import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/contact.dart';
import 'package:qr_app/widgets/home.dart';
import 'package:qr_app/widgets/qr_appbar.dart';
import 'package:qr_app/widgets/text.dart';
import 'package:qr_app/widgets/url.dart';
import 'package:qr_app/widgets/vcard.dart';
import 'package:qr_app/widgets/wifi.dart';

void main() => runApp(const GetMaterialApp(home: generatePage()));

class generatePage extends StatelessWidget {
  const generatePage({super.key});

  @override
  Widget build(context) {    

    return Scaffold(
      appBar: buildReusableAppBar(),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Column(
          children: <Widget>[
            const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 70.0,width: 20.0,),
              Text('Generate QR Code', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            ],),
            const SizedBox(height: 30.0),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton.icon(
                onPressed: () => Get.to(url()), 
                icon: Icon(Icons.web, color: Colors.black),
                label: Text('URL'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 100.0,width: 30.0),
              OutlinedButton.icon(
                onPressed: () => Get.to(wifi(TextEditingController(), TextEditingController(), DropdownController())),   
                icon: Icon(Icons.wifi, color: Colors.black),
                label: Text('WiFi'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 100.0,width: 30.0),
              OutlinedButton.icon(
                onPressed: () => Get.to(text()), 
                icon: Icon(Icons.text_fields_outlined, color: Colors.black),
                label: Text('Text'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),],),

            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100.0,),
              OutlinedButton.icon(
                onPressed: () => Get.to(vCard(TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), )), 
                icon: Icon(Icons.card_membership_outlined, color: Colors.black),
                label: Text('vCard'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(width: 30.0,height: 100.0,),
              OutlinedButton.icon(
                onPressed: () => Get.to(contact(TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController(),)), 
                icon: Icon(Icons.info, color: Colors.black),
                label: Text('Contact'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),],
            ),
            const SizedBox(height: 200.0),
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
            /*Padding(
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
            ),*/
          ],
        ),
      ),
    );
  }
}