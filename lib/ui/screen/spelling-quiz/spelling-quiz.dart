import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/widgets/constants/quizContainer/solve_quiz_container.dart';
import 'package:get/get.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    // quizController.getData();
    Get.put(QuizGetx()); //컨트롤러에 종속성 주입
    return GetBuilder<QuizGetx>(builder: (x) {
      return Scaffold(
        resizeToAvoidBottomInset: false, //키보드에 가려지는 위젯 오버플로우 방지
        backgroundColor: x.answerIsCollect == "Normal"
            ? const Color(0xFFeff0f0)
            : const Color(0xFFeff0f0),
        // backgroundColor: Colors.black,
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
                  // ttsTap: () async {
                  //   var result = await x.flutterTts.speak("영준아.");
                  // },
                  ttsTap: () {},
                  problemText: '바보',
                  editController: x.textEditController,
                  difficulty: "상", //type string으로 바꿔놈
                  submit: () {
                    x.checkAnswer();
                  },
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
