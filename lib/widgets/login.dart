//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/controller/login_controller.dart';
import 'package:qr_app/widgets/home.dart';
import 'package:qr_app/widgets/qr_appbar.dart';
import 'package:qr_app/widgets/signup.dart';
import 'package:qr_app/widgets/welcome.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildReusableAppBar(),
      body: Container(
          color: const Color.fromARGB(255, 117, 195, 219),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Log in to your account', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
                const SizedBox(height: 50.0),
                TextField(
                  controller: controller.usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {                    
                      controller.check();                    
                      if(controller.user.value != null) {
                        Get.to(homePage());
                      }                    
                    },
                  child: const Text('Login', style: TextStyle(color: Colors.black),),
                ),                
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Don't have an accont!!!"),
                  TextButton(
                    onPressed:(){ 
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>SignUpPage()),
                        );
                      },
                    child: Text(
                      'Create account',style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  ]
                ),
                // const Text('Or', style: TextStyle(fontWeight: FontWeight.bold),),
                // const SizedBox(height: 20.0),
                // ElevatedButton(
                //   onPressed: (){Get.to(SignUpPage());},
                //   child: const Text('Create account', style: TextStyle(color: Colors.black),),
                // ),
                const SizedBox(height: 60.0),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(const welcomepage()),
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
        )
    );
  }
}
