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
    Get.to(const Home());
  }

  void checkAnswer({required String? answer}) {
    // textEditController의 값이랑 비교하면 됨
    // 여기에 답을 확인하는 로직 작성
    // 정답이면 answerIsCollect = "collect"
    // 아니면 answerIsCollect = "notCollect"
    if (progress == 4) {
      Get.to(const Result());
    } else {
      print(textEditController.text);
      if (textEditController.text == answer) {
        print("정답");
        answerIsCollect("collect");
        problemTrue++;
        progress++;
      } else {
        print("오답");
        answerIsCollect("notCollect");
        progress++;
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
      Get.to(const Result());
    } else {
      if (answer == selection) {
        answerIsCollect("collect");
        print("정답");
        problemTrue++;
      } else {
        answerIsCollect("notCollect");
        print("오답");
      }
      // answerIsCollect = RxString("Normal");
    }
  }
}
