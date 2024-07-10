
import 'package:flutter/material.dart';

AppBar buildReusableAppBar() {
  return AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change your color here
        ),
        title: const Text("QR Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.black,
      );
}
