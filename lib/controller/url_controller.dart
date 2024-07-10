import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/database/database_helper.dart';
import 'package:qr_app/models/myqrcode.dart';
import 'package:uuid/uuid.dart';

class UrlController extends GetxController {

  TextEditingController websiteController = TextEditingController();
  Rx<MyQRCode> qrCode = MyQRCode.empty.obs;
    
  @override
  void onInit() {
    super.onInit();
  }

  void generateQr() async {   
    qrCode.value.id = Uuid().v4();
    qrCode.value.content = websiteController.text;
    qrCode.value.contentType = "url";
    qrCode.value.generateDate = DateTime.now().toIso8601String();
    await DatabaseHelper().insertQR(qrCode.value); 
  }
}