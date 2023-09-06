import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/firebase_options.dart';
import 'package:flutter_project/pages/login/login.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const GetMaterialApp(
    // home: Home(),
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}
