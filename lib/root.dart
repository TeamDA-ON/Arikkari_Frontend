import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/login/login.dart';
import 'package:logger/logger.dart';

import 'mainpage.dart';
import './utilities/logger.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext _, AsyncSnapshot<User?> snapshot) {
        logger.d(snapshot.hasData);
        if (snapshot.hasData) {
          User? user = snapshot.data;
          Logger().d(user);
          return const Login();
          // Login()
        } else {
          return MainPage();
        }
      },
    );
  }
}
