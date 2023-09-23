import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/widgets/constants/appbar.dart';
import 'package:get/get.dart';
import '../../widgets/constants/quizContainer/solve_quiz_container.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    // quizController.getData();
    Get.put(QuizGetx()); //컨트롤러에 종속성 주입
    return GetBuilder<QuizGetx>(builder: (x) {
      return Scaffold(
        appBar: appBar(),
        resizeToAvoidBottomInset: false, //키보드에 가려지는 위젯 오버플로우 방지
        //정답을 맞추면 answerIsCollect값을 봐꿔서 backgroundColor바꾸면됨
        backgroundColor: x.answerIsCollect == "Normal"
            ? const Color(0xFFeff0f0)
            : const Color(0xFFeff0f0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            // color: const Color(0xFFeff0f0),
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                solveQuizContainer(
                    ttsTap: () {
                      x.usingTts();
                    },
                    isTypeSpelling: x.isQuizSpelling,
                    problemText: 'Test',
                    editController: x.textEditController,
                    difficulty: "상", //type string으로 바꿔놈
                    submit: () {
                      x.checkAnswer();
                    },
                    api: x.quizApi),
                SizedBox(
                  height: Get.height * 0.1,
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
