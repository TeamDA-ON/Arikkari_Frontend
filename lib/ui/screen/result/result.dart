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
            width: Get.width,
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
                  height: Get.height * 0.12,
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
                  height: Get.height * 0.12,
                ),
                ResultButton(x)
              ],
            ),
          ),
        );
      },
    );
  }
}
