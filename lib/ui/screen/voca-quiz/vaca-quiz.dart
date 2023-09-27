import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/widgets/pages/voca-quiz/button.dart';
import 'package:get/get.dart';
import '../../widgets/pages/voca-quiz/voca_QuizContainer.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';

int? id;
int? answer;
String? difficulty;
String? problem;
String? selection1;
String? selection2;
String? selection3;
String? commentary;

class Voca extends StatelessWidget {
  const Voca({super.key});
  Future<void> getData() async {
    var dio = Dio();
    try {
      final response = await dio.get(
          'https://port-0-arikkari-backend-mvp-2rrqq2blmy418s6.sel5.cloudtype.app/api/mcq/get');
      difficulty = response.data[0]['difficulty'];
      answer = response.data[0]['answer'];
      problem = response.data[0]['problem'];
      selection1 = response.data[0]['selection1'];
      selection2 = response.data[0]['selection2'];
      selection3 = response.data[0]['selection3'];
      commentary = response.data[0]['commentary'];
    } catch (error) {
      print('에러 :: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(QuizGetx());
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
                backgroundColor: const Color(0xFFeff0f0),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    // color: const Color(0xFFeff0f0),
                    width: double.maxFinite,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.1,
                            ),
                            voca_QuizContainer(
                              difficulty: difficulty,
                              answer: answer,
                              commentary: commentary,
                              problem: problem,
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            Column(
                              children: [
                                button(
                                  onTap: () {},
                                  quizSelection: selection1,
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                button(
                                  onTap: () {},
                                  quizSelection: selection2,
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                button(
                                  onTap: () {},
                                  quizSelection: selection3,
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
            }
          },
        );
      },
    );
  }
}
