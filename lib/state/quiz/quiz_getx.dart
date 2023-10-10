import 'package:flutter/material.dart';
import 'package:flutter_project/ui/screen/home/home.dart';
import 'package:flutter_project/ui/screen/result/result.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class QuizGetx extends GetxController {
  static QuizGetx get to => Get.find();
  RxInt progress = 0.obs;
  int problemTrue = 0;
  RxString answerIsCollect = "Normal".obs;
  RxBool isLoading = false.obs;

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

  void goHome() {
    Get.to(() => const Home());
  }

  void checkAnswer({required String? answer}) {
    isLoading(false);
    // textEditController의 값이랑 비교하면 됨
    // 여기에 답을 확인하는 로직 작성
    // 정답이면 answerIsCollect = "collect"
    // 아니면 answerIsCollect = "notCollect"
    print("컨트롤러 ${textEditController.text}");
    print("답 $answer");
    if (progress == 4) {
      progress(0);
      Get.to(() => const Result());
    } else {
      if (textEditController.text == answer) {
        print("정답");
        // answerIsCollect = RxString("collect");
        answerIsCollect('collect');
        problemTrue++;
      } else {
        print("오답");
        // answerIsCollect = RxString("notCollect");
        answerIsCollect('notCollect');
      }
    }
  }

  void vocaAnswer({
    required int? answer,
    required int? selection,
    required Function() changeBackgroundColor,
  }) {
    changeBackgroundColor();
    if (progress == 4) {
      Get.to(() => const Result());
      progress = RxInt(0);
    } else {
      if (answer == selection) {
        answerIsCollect("collect");
        print("정답");
        problemTrue++;
        Future.delayed(const Duration(milliseconds: 3000), () {
          answerIsCollect("Normal");
          progress++;
        });
      } else {
        answerIsCollect("notCollect");
        print("오답");
        Future.delayed(const Duration(milliseconds: 3000), () {
          // 5초 딜레이 5초 동안 버튼이 계속 눌려지는데 나중에 팝업 추가하면서 버튼 가리면 될 듯
          answerIsCollect("Normal");
          progress++;
        });
      }
      // answerIsCollect = RxString("Normal");
    }
  }
}
