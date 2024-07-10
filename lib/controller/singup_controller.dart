import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/database/database_helper.dart';
import 'package:qr_app/models/user.dart';

class SingupController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController CpasswordController = TextEditingController();

  final user = User.empty.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void register() async {
    user.value.userName = usernameController.text;
    user.value.displayName = displayNameController.text;
    user.value.password = passwordController.text;
    user.value.phone = phoneController.text;
    user.value.email = emailController.text;
    await DatabaseHelper().insertUser(user.value);
  }
}
