import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/controller/singup_controller.dart';
import 'package:qr_app/models/user.dart';
import 'package:qr_app/widgets/login.dart';
import 'package:qr_app/widgets/welcome.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignUpPage(),
    );
  }
}*/

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _CpasswordController = TextEditingController();


  final SingupController controller = Get.put(SingupController());
  User user = User(userName: '', displayName: '', password: '');
  
  User mapToUser(
      TextEditingController name,
      TextEditingController dispName,
      TextEditingController pass,
      TextEditingController email,
      TextEditingController phone) {
    return User(
        userName: name.text,
        displayName: dispName.text,
        password: pass.text,
        email: email.text,
        phone: phone.text);
  }

  SignUpPage({super.key});


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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Create your account', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 50.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _displayNameController,
              decoration: const InputDecoration(
                labelText: 'Display Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _CpasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //onPressed: () => Get.to(const homePage()),
              onPressed: () {
                controller.register(mapToUser(_usernameController, _displayNameController,
                    _passwordController, _emailController, _phoneController));
                Get.to(LoginPage());
              },
              child: const Text('Sign Up', style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 30.0),
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
    );
  }
}
