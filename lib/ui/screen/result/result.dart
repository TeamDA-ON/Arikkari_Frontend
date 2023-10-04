import 'package:flutter/material.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:flutter_project/ui/widgets/pages/result/resultButton.dart';
import 'package:get/get.dart';

import '../../_constant/theme/app_colors.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizGetx());
    return GetBuilder<QuizGetx>(
      builder: (x) {
        return Scaffold(
          body: Container(
            color: AppColors.blueF3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                const Text(
                  "정답률", // 가져온 데이터의 일부를 표시
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                SizedBox(
                  width: 260,
                  height: 260,
                  child: CircleProgressBar(
                    foregroundColor: AppColors.white,
                    backgroundColor: Colors.black12,
                    value: x.problemTrue * 2 / 10,
                    child: Center(
                      child: Text(
                        '${x.problemTrue * 20}%',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                ResultButton(x),
                const Spacer(),
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: const [
                        SizedBox(
                            width: 100,
                            child: Divider(
                              color: Color(0xFF7A7A7A),
                              thickness: 2.0,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
