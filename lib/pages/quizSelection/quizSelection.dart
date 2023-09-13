import 'package:flutter/material.dart';
import 'package:flutter_project/model/model_quiz.dart';
import 'package:flutter_project/pages/home/home.dart';
import 'package:flutter_project/pages/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_project/widgets/constants/appbar.dart';
import 'package:flutter_project/widgets/pages/quizSelection/selectBox.dart';
import 'package:get/get.dart';

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
          children: const [
            selectBox(
              Page: Quiz(),
              title: '맞춤법 퀴즈',
              subTitle: '문장을 듣고 빈칸을 채워 맞춤법을 공부해요.',
              textColor: Color(0xFF5B5DC9),
            ),
            SizedBox(
              height: 40,
            ),
            selectBox(
              Page: Quiz(),
              title: '어휘 퀴즈',
              subTitle: '문장에 알맞은 단어를 찾아 어휘를 키워요.',
              textColor: Color(0xFF92B4EC),
            ),
          ],
        ),
      ),
    );
  }
}
