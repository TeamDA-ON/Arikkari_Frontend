import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/widgets/pages/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:get/get.dart';

int? id;
String? difficulty;
String? answer;
String? problem1;
String? problem2;
String? commentary;
late final response;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    Future<void> getData() async {
      var dio = Dio();
      try {
        response = await dio.get(
            'https://port-0-arikkari-backend-mvp-2rrqq2blmy418s6.sel5.cloudtype.app/api/saq/get');
        // difficulty = response.data[0]['difficulty'];
        // answer = response.data[0]['answer'];
        // problem1 = response.data[0]['problem1'];
        // problem2 = response.data[0]['problem2'];
        // commentary = response.data[0]['commentary'];
        logger.d(response.data);
      } catch (error) {
        print('에러 :: $error');
      }
    }

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
                        Obx(
                          () => spelling_QuizContainer(
                            problem1: response.data[x.progress.value]
                                ['problem1'],
                            problem2: response.data[x.progress.value]
                                ['problem2'],
                            difficulty: response.data[x.progress.value]
                                ['difficulty'],
                            answer: response.data[x.progress.value]['answer'],
                            ttsTap: () {
                              x.usingTts(
                                problem1: response.data[x.progress.value]
                                    ['problem1'],
                                problem2: response.data[x.progress.value]
                                    ['problem2'],
                                answer: response.data[x.progress.value]
                                    ['answer'],
                              );
                            },
                            editController: x.textEditController,
                            submit: () {
                              x.checkAnswer(
                                answer: response.data[x.progress.value]
                                    ['answer'],
                              );
                            },
                            commentary: response.data[x.progress.value]
                                ['commentary'],
                          ),
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
