import 'package:flutter/material.dart';
import 'package:flutter_project/ui/screen/home/home.dart';
import 'package:flutter_project/ui/screen/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

Map<String, dynamic> jsonData = {
  'id': 1,
  'difficulty': '하',
  'answer': '문제',
  'problem1': "문제 앞쪽",
  'problem2': '문제 뒷쪽',
  'Commentary': '해설',
};

class QuizGetx extends GetxController {
  static QuizGetx get to => Get.find();
  RxInt progress = RxInt(0);
  bool isQuizSpelling = jsonData['problem1'] != null;
  Map<String, dynamic> quizApi = jsonData;
  String answerIsCollect = "Normal";

  // final quiz = Spelling_Quiz(
  //   answer: '',
  //   description: '',
  //   difficulty: 1,
  //   problem: '',
  // ).obs;
  void usingTts({
    required String? problem1,
    required String? problem2,
    required String? answer,
  }) async {
    FlutterTts flutterTts = FlutterTts();
    String speakVoice = problem1! + answer! + problem2!;
    await flutterTts.speak(speakVoice);
  }

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
      Get.to(const Quiz()); //false면 selectBox로 이동하면됨
    }
  }

  void onSubmit() {
    // quizController.getData();
    // String textResult = textEditController.text.trim();
    // print('textResult : $textResult');
    // if (textResult == quiz.value.answer) {
    //   print('정답');
    // } else {
    //   print('오답');
    // }
  }

  void checkAnswer() {
    // textEditController의 값이랑 비교하면 됨
    // 여기에 답을 확인하는 로직 작성
    // 정답이면 answerIsCollect = "collect"
    // 아니면 answerIsCollect = "notCollect"
  }

  void vocaAnswer({
    required int? answer,
    required int? selection,
  }) {
    if (progress == 4) {
      Get.to(const Home());
    } else {
      if (answer == selection) {
        print("정답");
        progress++;
      } else {
        print("오답");
        progress++;
      }
    }
  }
}
