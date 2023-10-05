import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_getx.dart';
import 'package:get/get.dart';

import 'package:flutter_project/ui/_constant/theme/app_colors.dart';

GestureDetector ResultButton(QuizGetx x) {
  return GestureDetector(
    onTap: () => {
      x.goHome(),
      x.problemTrue = 0,
    },
    child: Container(
      width: Get.width * 0.6,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          "확인",
          style: TextStyle(
            color: AppColors.blueF3,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
