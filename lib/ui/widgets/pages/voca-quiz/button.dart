import 'package:flutter/material.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:get/get.dart';

GestureDetector button({
  required Function() onTap,
  required String? quizSelection,
}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      height: 54,
      width: Get.width * 1,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xFFD9D9D9), width: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quizSelection ?? '',
            style: const TextStyle(
              color: AppColors.darkGrayF1,
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
        ],
      ),
    ),
  );
}
