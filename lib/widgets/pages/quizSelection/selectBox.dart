import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../pages/spelling-quiz/spelling-quiz.dart';

class selectBox extends StatelessWidget {
  final String title, subTitle;
  final Color textColor;
  final onTaps;

  const selectBox({
    super.key,
    required this.title,
    required this.subTitle,
    required this.textColor,
    required this.onTaps,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => QuizController());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
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
}