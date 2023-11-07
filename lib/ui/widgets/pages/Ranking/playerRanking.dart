import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding playerRanking(
    {required String ranking,
    required String name,
    required String belong,
    required String score}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
    child: Container(
      width: Get.width,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ranking == '1'
              ? const Color(0xFFFEE500)
              : ranking == '3'
                  ? const Color(0xffF4B072)
                  : const Color(0xffD9D9D9),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ranking,
              style: TextStyle(
                color: ranking == '1'
                    ? const Color(0xFFFEE500)
                    : ranking == '3'
                        ? const Color(0xffF4B072)
                        : ranking == '2'
                            ? const Color(0xffD9D9D9)
                            : const Color(0xff000000),
                fontSize: 22,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(
              width: 120,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Text(
                belong,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Text(
              score,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
