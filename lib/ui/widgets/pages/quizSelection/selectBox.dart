import 'package:flutter/material.dart';
import 'package:get/get.dart';

GestureDetector selectBox({
  required Function() onTap,
  required Color textColor,
  required String title,
  required String subTitle,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: Get.width * 1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: textColor,
          width: 5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 32,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                color: Color(0xFF7A7A7A),
                fontSize: 16,
                fontFamily: "Pretendard",
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
