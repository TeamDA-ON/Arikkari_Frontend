import 'package:flutter/material.dart';
import 'package:flutter_project/state/home/home_getx.dart';
import 'package:flutter_project/ui/screen/quizSelection/quizSelection.dart';
import 'package:get/get.dart';

import '../../_constant/theme/app_colors.dart';

class QuizStart extends StatelessWidget {
  const QuizStart({super.key});

  // String todayWorld = '가타부타';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeGetx>(
      builder: (x) {
        return Scaffold(
          body: Container(
            color: AppColors.blueF3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  'assets/img/homeLogo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  '퀴즈 풀러가기',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const quizSelection());
                  },
                  child: SizedBox(
                    height: 99,
                    width: 99,
                    child: Image.asset(
                      'assets/img/start.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            margin: const EdgeInsets.only(bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  x.todayWord ?? '일단 빈값',
                                  style: const TextStyle(
                                      color: AppColors.blueF3,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: -30,
                            child: Container(
                              width: 210,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '오늘의 단어',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: AppColors.darkGrayF1,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
