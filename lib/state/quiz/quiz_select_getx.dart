import 'package:flutter_project/ui/screen/spelling-quiz/spelling-quiz.dart';
import 'package:flutter_project/ui/screen/voca-quiz/vaca-quiz.dart';
import 'package:get/get.dart';

class QuizSelectGetx extends GetxController {
  static QuizSelectGetx get to => Get.find();
  void chagePage(bool isGoSpelling) {
    if (isGoSpelling) {
      Get.to(const Quiz());
    } else {
      Get.to(const Voca());
    }
  }
}
