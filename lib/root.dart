import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/screen/home/home.dart';
import 'package:flutter_project/ui/screen/login/login.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizGetx>(
      builder: (x) {
        return FutureBuilder(
          future: x.token(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (x.refreshToken != null && x.refreshToken!.isNotEmpty) {
                return const Home();
              } else {
                return const Login();
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
