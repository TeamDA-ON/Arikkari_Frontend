import 'package:dio/dio.dart';
import 'package:flutter_project/model/model_spellingQuiz.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:get/get.dart';

class Spelling_QuizController extends GetxController {
  final Rxn<Spelling_Quiz> quiz = Rxn();

  Future<void> getData() async {
    var dio = Dio();
    try {
      var response = await dio.get('/api/saq/get');

      quiz.value = Spelling_Quiz.fromMap(response.data);
      logger.d(quiz.value?.answer ?? 'null');
      logger.d(quiz.value.toString());
    } catch (error) {
      print('에러 :: $error');
    }
  }
}
