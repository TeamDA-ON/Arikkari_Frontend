import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/widgets/quizContainer/solve_quiz_container.dart';
import 'package:get/get.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

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
                Obx(
                  () => solveQuizContainer(
                    ttsTap: () async {
                      var result = await x.flutterTts.speak("");
                    },
                    difficulty: x.quiz,
                    editController: x.textEditController,
                    problemText: x.quiz,
                    submit: () {
                      x.onSubmit();
                    },
                  ),
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
