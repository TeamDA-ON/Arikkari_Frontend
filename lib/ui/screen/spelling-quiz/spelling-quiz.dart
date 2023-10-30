import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/widgets/pages/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:get/get.dart';
import 'package:flutter_project/repository/data/http_client.dart';

int? id;
String? difficulty;
String? answer;
String? problem1;
String? problem2;
String? commentary;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    late final dynamic response;
    Future<void> getData() async {
      var dio = Dio();
      try {
        response = await dio.get('${HttpClients.hostUrl}/api/saq/get');

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
              return Obx(
                () => GestureDetector(
                  onTap: x.answerIsCollect == "Normal"
                      ? null
                      : () => {
                            x.answerIsCollect("Normal"),
                            x.progress(x.progress.value + 1),
                            x.textEditController.text = "",
                          },
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    backgroundColor: x.answerIsCollect == "Normal"
                        ? AppColors.lightGrayF1
                        : x.answerIsCollect == "collect"
                            ? AppColors.light_green // 정답일때
                            : AppColors.red1, // 오답일때
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
                              isLoading: x.isLoading.value,
                              quizCount: x.progress.value,
                              answerIsCollect: x.answerIsCollect,
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
                              checkAnswer: () {
                                x.checkAnswer(
                                  answer: response.data[x.progress.value]
                                      ['answer'],
                                );
                              },
                              commentary: response.data[x.progress.value]
                                  ['commentary'],
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
