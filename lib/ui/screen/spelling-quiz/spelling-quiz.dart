import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/widgets/constants/quizContainer/solve_quiz_container.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Quiz extends StatelessWidget {
  Quiz({super.key});
  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    // quizController.getData();
    return GetBuilder<QuizGetx>(builder: (x) {
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
                solveQuizContainer(
                  ttsTap: () async {
                    var result = await flutterTts.speak("영준아.");
                  },
                  problemText: '바보',
                  editController: editController,
                  difficulty: '상',
                  submit: submit,
                ),
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
    });
  }
}
