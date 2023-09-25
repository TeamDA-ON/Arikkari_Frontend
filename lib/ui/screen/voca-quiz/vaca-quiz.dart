import 'package:flutter/material.dart';
import 'package:flutter_project/ui/widgets/pages/voca-quiz/button.dart';
import 'package:get/get.dart';
import '../../widgets/constants/quizContainer/solve_quiz_container.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';

class Voca extends StatefulWidget {
  const Voca({super.key});

  @override
  State<Voca> createState() => _VocaState();
}

class _VocaState extends State<Voca> {
  String difficulty = '중';

  void quizAnswer() {}
  @override
  Widget build(BuildContext context) {
    Get.put(QuizGetx());
    return GetBuilder<QuizGetx>(builder: (x) {
      return Scaffold(
        backgroundColor: const Color(0xFFeff0f0),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            // color: const Color(0xFFeff0f0),
            width: double.maxFinite,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                primary: false,
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
                      height: Get.height * 0.04,
                    ),
                    Column(
                      children: [
                        button(
                          onTap: () {},
                          quizSelection: '아리까리',
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        button(
                          onTap: () {},
                          quizSelection: '아리까리',
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        button(
                          onTap: () {},
                          quizSelection: '아리까리',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
