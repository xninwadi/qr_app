import 'package:get/get.dart';
import 'package:qr_app/database/database_helper.dart';
import 'package:qr_app/models/user.dart';

class SingupController extends GetxController {
  final user = User(id: 0, userName: '', displayName: '', password: '').obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updateUser(User newUser) {
    user.value = newUser;
  }

  void register(User user) async {
    await DatabaseHelper().insertUser(user);
  }
}
