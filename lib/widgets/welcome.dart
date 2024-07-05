import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/widgets/login.dart';
import 'package:qr_app/widgets/signup.dart';

class welcomepage extends StatelessWidget {
  const welcomepage({super.key});

  @override
  Widget build(context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,),
      body: Container(
        color: const Color.fromARGB(255, 117, 195, 219),
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
            image: AssetImage('images/logo.png'),
            width: 200,
            height: 200,
            ),
            const SizedBox(height: 30.0),
            OutlinedButton.icon(
                onPressed: () => Get.to(LoginPage()), 
                icon: Icon(Icons.login, color: Colors.black),
                label: Text('Log in'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            const SizedBox(height: 35.0),
            OutlinedButton.icon(
                onPressed: () => Get.to(SignUpPage()), 
                icon: Icon(Icons.person_add, color: Colors.black),
                label: Text('Sign up'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.black,
                 side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
          ],),
        ),
      ),
    );
  }    
}