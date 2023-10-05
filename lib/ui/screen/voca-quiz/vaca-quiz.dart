import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/widgets/pages/voca-quiz/button.dart';
import 'package:flutter_project/ui/widgets/pages/voca-quiz/voca_QuizContainer.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:get/get.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';

int? id;
RxInt answer = RxInt(0);
RxString difficulty = RxString('');
RxString? problem = RxString('');
RxString? selection1 = RxString('');
RxString? selection2 = RxString('');
RxString? selection3 = RxString('');
RxString? commentary = RxString('');
late final response;

class Voca extends StatefulWidget {
  const Voca({super.key});

  @override
  State<Voca> createState() => _VocaState();
}

class _VocaState extends State<Voca> {
  Future<void> getData(QuizGetx x) async {
    var dio = Dio();
    try {
      response = await dio.get(
          'https://port-0-arikkari-backend-mvp-2rrqq2blmy418s6.sel5.cloudtype.app/api/mcq/get');
      // difficulty.value = response.data[x.progress.value]['difficulty'];
      // answer.value = response.data[x.progress.value]['answer'];
      // problem?.value = response.data[x.progress.value]['problem'];
      // selection1?.value = response.data[x.progress.value]['selection1'];
      // selection2?.value = response.data[x.progress.value]['selection2'];
      // selection3?.value = response.data[x.progress.value]['selection3'];
      // commentary?.value = response.data[x.progress.value]['commentary'];
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
          : x.answerIsCollect == 'true'
              ? AppColors.green
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
                () => Scaffold(
                  backgroundColor: x.answerIsCollect == "Normal"
                      ? AppColors.lightGrayF1
                      : x.answerIsCollect == "collect"
                          ? AppColors.green
                          : AppColors.red1,
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
                                  progressNumber: x.progress,
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
                                        x.vocaAnswer(
                                            answer:
                                                response.data[x.progress.value]
                                                    ['answer'],
                                            selection: 1,
                                            changeBackgroundColor: () =>
                                                changeBackgroundColor),
                                        setState(
                                          () => x.answerIsCollect,
                                        ),
                                      },
                                      quizSelection: response
                                          .data[x.progress.value]['selection1'],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    button(
                                      onTap: () => {
                                        x.vocaAnswer(
                                          answer: response
                                              .data[x.progress.value]['answer'],
                                          selection: 2,
                                          changeBackgroundColor: () =>
                                              changeBackgroundColor,
                                        ),
                                        setState(
                                          () => x.answerIsCollect,
                                        ),
                                      },
                                      quizSelection: response
                                          .data[x.progress.value]['selection2'],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    button(
                                      onTap: () => {
                                        x.vocaAnswer(
                                          answer: response
                                              .data[x.progress.value]['answer'],
                                          selection: 3,
                                          changeBackgroundColor: () =>
                                              changeBackgroundColor,
                                        ),
                                        setState(
                                          () => x.answerIsCollect,
                                        ),
                                      },
                                      quizSelection: response
                                          .data[x.progress.value]['selection3'],
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
              );
            }
          },
        );
      },
    );
  }
}
