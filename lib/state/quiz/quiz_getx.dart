import 'package:flutter/material.dart';
import 'package:flutter_project/model/model_quiz.dart';
import 'package:flutter_project/ui/screen/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class QuizGetx extends GetxController {
  static QuizGetx get to => Get.find();
  bool isShowButton = true;
  String answerIsCollect = "Normal";

  final quiz = Spelling_Quiz(
    answer: '',
    description: '',
    difficulty: 1,
    problem: '',
  ).obs;

  FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditController = TextEditingController();

  // Future<void> getData() async {
  //   try {
  //     Dio dio = Dio();
  //     var response = await dio.get('http://localhost:8080/question/api/get/3');
  //     quiz.value = Spelling_Quiz.fromMap(response.data);
  //     print(quiz.value.answer);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  void chagePage(bool isGoSpelling) {
    // isShowButton = isGoSpelling ? false : true;
    update();
    if (isGoSpelling) {
      Get.to(const Quiz());
    } else if (!isGoSpelling) {
      Get.to(const Quiz());
    }
  }

  void onSubmit() {
    // quizController.getData();
    String textResult = textEditController.text.trim();
    print('textResult : $textResult');
    if (textResult == quiz.value.answer) {
      print('정답');
    } else {
      print('오답');
    }
  }

  checkAnswer() {
    // textEditController의 값이랑 비교하면 됨
    // 여기에 답을 확인하는 로직 작성
    // 정답이면 answerIsCollect = "collect"
    // 아니면 answerIsCollect = "notCollect"
  }
}
