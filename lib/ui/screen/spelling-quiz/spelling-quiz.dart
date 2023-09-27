import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/widgets/pages/spelling-quiz/spelling-quiz.dart';
import 'package:get/get.dart';

int? id;
String? difficulty;
String? answer;
String? problem1;
String? problem2;
String? commentary;

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  Future<void> getData() async {
    var dio = Dio();
    try {
      final response = await dio.get(
          'https://port-0-arikkari-backend-mvp-2rrqq2blmy418s6.sel5.cloudtype.app/api/saq/get');
      difficulty = response.data[0]['difficulty'];
      answer = response.data[0]['answer'];
      problem1 = response.data[0]['problem1'];
      problem2 = response.data[0]['problem2'];
      commentary = response.data[0]['commentary'];
    } catch (error) {
      print('에러 :: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(QuizGetx()); //컨트롤러에 종속성 주입
    return GetBuilder<QuizGetx>(
      builder: (x) {
        return FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: x.answerIsCollect == "Normal"
                    ? const Color(0xFFeff0f0)
                    : const Color(0xFFeff0f0),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        spelling_QuizContainer(
                          problem1: problem1,
                          problem2: problem2,
                          difficulty: difficulty,
                          answer: answer,
                          ttsTap: () {
                            x.usingTts(
                              problem1: problem1,
                              problem2: problem2,
                              answer: answer,
                            );
                          },
                          editController: x.textEditController,
                          submit: () {
                            x.checkAnswer();
                          },
                          commentary: '',
                        ),
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
            }
          },
        );
      },
    );
  }
}
