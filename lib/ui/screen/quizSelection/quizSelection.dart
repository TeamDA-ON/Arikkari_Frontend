import 'package:flutter/material.dart';
import 'package:flutter_project/state/quiz/quiz_select_getx.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/widgets/constants/appbar.dart';
import 'package:flutter_project/ui/widgets/pages/quizSelection/selectBox.dart';
import 'package:get/get.dart';

class quizSelection extends StatelessWidget {
  const quizSelection({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizSelectGetx());
    return GetBuilder<QuizSelectGetx>(builder: (x) {
      return Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectBox(
                onTap: () => x.chagePage(
                  true,
                ),
                title: '맞춤법 퀴즈',
                subTitle: '문장을 듣고 빈칸을 채워 맞춤법을 공부해요.',
                textColor: AppColors.blueF2,
              ),
              const SizedBox(
                height: 40,
              ),
              selectBox(
                onTap: () => x.chagePage(
                  false,
                ),
                title: '어휘 퀴즈',
                subTitle: '문장에 알맞은 단어를 찾아 어휘를 키워요.',
                textColor: AppColors.blueF4,
              ),
            ],
          ),
        ),
      );
    });
  }
}
