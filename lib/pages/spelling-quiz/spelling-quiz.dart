import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_project/model/model_quiz.dart';
import 'package:get/get.dart';
import 'package:flutter_project/pages/spelling-quiz/quizContainer.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    // quizController.getData();
    return Scaffold(
      resizeToAvoidBottomInset: false, //키보드에 가려지는 위젯이 생길때 오버플로우 방지해주는 코드
      backgroundColor: const Color(0xFFeff0f0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          // color: const Color(0xFFeff0f0),
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const quizContainer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset(
                'assets/img/quizlogo.png',
                width: 120,
                height: 120,
                color: const Color(0xFF000000).withOpacity(0.08),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
