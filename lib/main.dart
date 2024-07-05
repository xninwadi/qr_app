import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'widgets/welcome.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  Logger.level = Level.debug;
  runApp(const GetMaterialApp(home: goHome()));
}

class goHome extends StatelessWidget {
  const goHome({super.key});

  @override
  Widget build(context) {    

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("QR", style: TextStyle(fontSize: 50.0 , fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            
            const Text("SERVICE", style: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            
            const SizedBox(height: 100.0),
            OutlinedButton(
              onPressed: () => Get.to(welcomepage()),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text('Start', style: TextStyle(
                  color: const Color.fromARGB(255, 5, 31, 77),
                  fontSize: 16,
                ),),
            )
          ],),
        ),
      ),
    );
  }
}