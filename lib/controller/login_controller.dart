import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:qr_app/database/database_helper.dart';
import 'package:qr_app/models/user.dart';

class LoginController extends GetxController {
  Rx<User> user = User(id: 0,userName: '', displayName: '', password: '').obs;
  
  @override
  void onInit() {
    super.onInit();
  }

  void updateUser(User? newUser) {
    user.value = newUser!;
    var sessionManager = SessionManager();
    sessionManager.set("name", newUser.displayName);
    sessionManager.set("email", newUser.email!);
  }

  void check(String name, String password) async {    
    try {
      var _user = await DatabaseHelper().checkLogin(name, password);   
      updateUser(User.map(_user));
    }catch(e) {
      print("check: "+e.toString()); 
      user.value.id = 0;
    }
  }
}
