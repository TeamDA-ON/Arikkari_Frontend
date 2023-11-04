import 'package:flutter/material.dart';
import 'package:flutter_project/repository/data/http_client.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/screen/result/result.dart';
import 'package:flutter_project/ui/widgets/pages/voca-quiz/button.dart';
import 'package:flutter_project/ui/widgets/pages/voca-quiz/voca_QuizContainer.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

int? id;
RxInt answer = 0.obs;
RxString difficulty = ''.obs;
RxString? problem = ''.obs;
RxString? selection1 = ''.obs;
RxString? selection2 = ''.obs;
RxString? selection3 = ''.obs;
RxString? commentary = ''.obs;

class Voca extends StatefulWidget {
  const Voca({super.key});

  @override
  State<Voca> createState() => _VocaState();
}

class _VocaState extends State<Voca> {
  late final dynamic response;
  Future<void> getData(QuizGetx x) async {
    var dio = Dio();
    try {
      response = await dio.get('${HttpClients.hostUrl}/api/mcq/get');
      logger.d(response.data);
    } catch (error) {
      print('에러 :: $error');
    }
  }

  Color? _backgroundColor;

  void changeBackgroundColor(QuizGetx x) {
    setState(() {
      _backgroundColor = x.answerIsCollect == 'Normal'
          ? AppColors.lightGrayF1
          : x.answerIsCollect == 'collect'
              ? AppColors.light_green
              : AppColors.red1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(QuizGetx());
    return GetBuilder<QuizGetx>(
      builder: (x) {
        return FutureBuilder(
          future: getData(x),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Obx(
                () => GestureDetector(
                  onTap: x.answerIsCollect == "Normal"
                      ? null
                      : () => {
                            x.answerIsCollect("Normal"),
                            if (x.progress.value == 4)
                              {
                                x.correct(),
                                x.wrong(),
                                Get.to(() => const Result()),
                              }
                            else
                              x.progress(x.progress.value + 1),
                          },
                  child: Scaffold(
                    backgroundColor: x.answerIsCollect == "Normal"
                        ? AppColors.lightGrayF1
                        : x.answerIsCollect == "collect"
                            ? AppColors.light_green
                            : AppColors.red1,
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
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
                                Obx(
                                  () => voca_QuizContainer(
                                    answerIsCollect: x.answerIsCollect,
                                    difficulty: response.data[x.progress.value]
                                        ['difficulty'],
                                    answer: response.data[x.progress.value]
                                        ['answer'],
                                    commentary: response.data[x.progress.value]
                                        ['commentary'],
                                    problem: response.data[x.progress.value]
                                        ['problem'],
                                    progressNumber: 1 + x.progress.value,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                Obx(
                                  () => Column(
                                    children: [
                                      button(
                                        onTap: () => {
                                          if (x.answerIsCollect == "Normal")
                                            {
                                              x.vocaAnswer(
                                                  answer: response.data[x
                                                      .progress
                                                      .value]['answer'],
                                                  selection: 1,
                                                  id: response.data[
                                                      x.progress.value]['id'],
                                                  changeBackgroundColor: () =>
                                                      changeBackgroundColor),
                                              setState(
                                                () => x.answerIsCollect,
                                              ),
                                            }
                                          else
                                            {
                                              x.answerIsCollect("Normal"),
                                              if (x.progress.value == 4)
                                                {
                                                  x.correct(),
                                                  x.wrong(),
                                                  Get.to(() => const Result()),
                                                }
                                              else
                                                x.progress(
                                                    x.progress.value + 1),
                                            }
                                        },
                                        quizSelection:
                                            response.data[x.progress.value]
                                                ['selection1'],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      button(
                                        onTap: () => {
                                          if (x.answerIsCollect == "Normal")
                                            {
                                              x.vocaAnswer(
                                                answer: response
                                                        .data[x.progress.value]
                                                    ['answer'],
                                                selection: 2,
                                                id: response
                                                        .data[x.progress.value]
                                                    ['id'],
                                                changeBackgroundColor: () =>
                                                    changeBackgroundColor,
                                              ),
                                              setState(
                                                () => x.answerIsCollect,
                                              ),
                                            }
                                          else
                                            {
                                              x.answerIsCollect("Normal"),
                                              if (x.progress.value == 4)
                                                {
                                                  x.correct(),
                                                  x.wrong(),
                                                  Get.to(() => const Result()),
                                                }
                                              else
                                                x.progress(
                                                    x.progress.value + 1),
                                            }
                                        },
                                        quizSelection:
                                            response.data[x.progress.value]
                                                ['selection2'],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.03,
                                      ),
                                      button(
                                        onTap: () => {
                                          if (x.answerIsCollect == "Normal")
                                            {
                                              x.vocaAnswer(
                                                answer: response
                                                        .data[x.progress.value]
                                                    ['answer'],
                                                selection: 3,
                                                id: response
                                                        .data[x.progress.value]
                                                    ['id'],
                                                changeBackgroundColor: () =>
                                                    changeBackgroundColor,
                                              ),
                                              setState(
                                                () => x.answerIsCollect,
                                              ),
                                            }
                                          else
                                            {
                                              x.answerIsCollect("Normal"),
                                              if (x.progress.value == 4)
                                                {
                                                  x.correct(),
                                                  x.wrong(),
                                                  Get.to(() => const Result()),
                                                }
                                              else
                                                x.progress(
                                                    x.progress.value + 1),
                                            }
                                        },
                                        quizSelection:
                                            response.data[x.progress.value]
                                                ['selection3'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
