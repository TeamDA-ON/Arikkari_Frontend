import 'package:dio/dio.dart';
import 'package:flutter_project/model/model_vocaQuiz.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:get/get.dart';

class Voca_QuizController extends GetxController {
  final Rxn<Voca_Quiz> quiz = Rxn();

  final Dio _dio = Dio(BaseOptions(
    baseUrl:
        'https://port-0-arikkari-backend-mvp-2rrqq2blmy418s6.sel5.cloudtype.app',
    connectTimeout: const Duration(
      milliseconds: 10000,
    ),
    receiveTimeout: const Duration(
      microseconds: 10000,
    ),
  ));

  Future<void> getData() async {
    try {
      // var response = await HttpClients.dio.get('/api/mcq/get');

      final response = await _dio.get('/api/saq/get');

      print(response.data);

      quiz.value = Voca_Quiz.fromMap(response.data[0]);
      logger.d(quiz.value?.answer ?? 'null');
      logger.d(quiz.value.toString());
    } catch (error) {
      print(error);
    }
  }
}
