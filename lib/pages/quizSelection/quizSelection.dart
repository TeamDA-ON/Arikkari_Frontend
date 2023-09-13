import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/constants/appbar.dart';
import 'package:flutter_project/widgets/pages/quizSelection/selectBox.dart';
import 'package:flutter_project/pages/spelling-quiz/quizContainer.dart';

class quizSelection extends StatelessWidget {
  const quizSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectBox(
              onTaps: QuizController(),
              title: '맞춤법 퀴즈',
              subTitle: '문장을 듣고 빈칸을 채워 맞춤법을 공부해요.',
              textColor: const Color(0xFF5B5DC9),
            ),
            const SizedBox(
              height: 40,
            ),
            selectBox(
              onTaps: QuizController(),
              title: '어휘 퀴즈',
              subTitle: '문장에 알맞은 단어를 찾아 어휘를 키워요.',
              textColor: const Color(0xFF92B4EC),
            ),
          ],
        ),
      ),
    );
  }
}
