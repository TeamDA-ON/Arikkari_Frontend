import 'package:flutter/material.dart';
import 'package:flutter_project/state/home/home_getx.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:get/get.dart';

import '../../_constant/theme/app_colors.dart';

class Result extends StatelessWidget {
  Result({super.key});

  String CorrectRate = '75.00%';

  @override
  Widget build(BuildContext context) {
    Get.put(HomeGetx());
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
                const Text(
                  "정답률", // 가져온 데이터의 일부를 표시
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: CircleProgressBar(
                    foregroundColor: AppColors.white,
                    backgroundColor: Colors.black12,
                    value: 0.5,
                    child: Center(
                      child: Text(
                        CorrectRate,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
