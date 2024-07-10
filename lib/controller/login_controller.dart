import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:qr_app/database/database_helper.dart';
import 'package:qr_app/models/user.dart';

class LoginController extends GetxController {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  RxString userId = "".obs;
  Rx<User> user = User.empty.obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  void updateUser(User newUser) {
    userId.value = newUser.id;
    var sessionManager = SessionManager();
    sessionManager.set("name", newUser.displayName);
    sessionManager.set("email", newUser.email!);
  }

  void check() async {    
    try {
      var _user = await DatabaseHelper().checkLogin(usernameController.text, passwordController.text);   
      updateUser(User.map(_user));
    }catch(e) {
      user.value.id = "";
    }
  }
}
