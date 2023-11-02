import 'package:flutter/material.dart';
import 'package:flutter_project/bottomBar.dart';
import 'package:flutter_project/repository/data/http_client.dart';
import 'package:flutter_project/ui/screen/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_project/ui/screen/voca-quiz/vaca-quiz.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class QuizGetx extends GetxController {
  RxInt progress = 0.obs;
  String quizType = "";
  int problemTrue = 0;
  RxString answerIsCollect = "Normal".obs;
  RxBool isLoading = false.obs;
  String? accessToken;
  String? refreshToken;
  List<int> correctList = [];
  List<int> wrongList = [];

  @override
  void onInit() async {
    super.onInit();
    await token();
  }

  Future<void> token() async {
    final prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('access_token') ?? '';
    refreshToken = prefs.getString('refresh_token') ?? '';
  }

  void chagePage(bool isGoSpelling) {
    if (isGoSpelling) {
      quizType = "SAQ";
      progress = RxInt(0);
      answerIsCollect = RxString("Normal");
      Get.to(() => const Spelling());
    } else {
      quizType = "MCQ";
      progress = RxInt(0);
      answerIsCollect = RxString("Normal");
      Get.to(() => const Voca());
    }
  }

  void usingTts({
    required String? problem1,
    required String? problem2,
    required String? answer,
  }) async {
    FlutterTts flutterTts = FlutterTts();
    String speakVoice = problem1! + answer! + problem2!;
    if (quizType == "SAQ") {
      await flutterTts.speak(speakVoice);
    }
  }

  TextEditingController textEditController = TextEditingController();

  void goHome() {
    Get.to(() => const BottomBar());
  }

  void wrong() async {
    Dio dio = Dio();
    String token = accessToken ?? '';
    logger.d(token);
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Map<String, dynamic> requestData = {
        'list': wrongList,
        'questionType': quizType,
      };

      final response = await dio.post(
        '${HttpClients.hostUrl}/api/wrong',
        data: requestData,
      );

      logger.d(response.data);
    } catch (error) {
      // 에러 처리
      logger.d('Error: $error');
    }
  }

  void correct() async {
    Dio dio = Dio();
    String token = accessToken ?? '';
    logger.d(token);
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      Map<String, dynamic> requestData = {
        'list': correctList,
        'questionType': quizType,
      };

      final response = await dio.post(
        '${HttpClients.hostUrl}/api/correct',
        data: requestData,
      );

      logger.d(response.data);
    } catch (error) {
      logger.d('Error: $error');
    }
  }

  void checkAnswer({required String? answer, required int id}) {
    isLoading(false);
    if (textEditController.text == answer) {
      print("정답");
      correctList.add(id);
      answerIsCollect('collect');
      problemTrue++;
    } else {
      print("오답");
      wrongList.add(id);
      answerIsCollect('notCollect');
    }
  }

  void vocaAnswer({
    required int? answer,
    required int? selection,
    required int id,
    required Function() changeBackgroundColor,
  }) {
    changeBackgroundColor();
    if (answer == selection) {
      answerIsCollect("collect");
      print("정답");
      correctList.add(id);
      problemTrue++;
    } else {
      answerIsCollect("notCollect");
      wrongList.add(id);
      print("오답");
    }
    // answerIsCollect = RxString("Normal");
  }
}
