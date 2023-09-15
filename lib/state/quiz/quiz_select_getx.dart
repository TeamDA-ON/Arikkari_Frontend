import 'package:get/get.dart';

class QuizSelectGetx extends GetxController {
  static QuizSelectGetx get to => Get.find();
  void chagePage(bool isGoSpelling) {
    if (isGoSpelling) {
      // 맞춤법 퀴즈로 이동
    } else {
      //어휘
    }
  }
}
