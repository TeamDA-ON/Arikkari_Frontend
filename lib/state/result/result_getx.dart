import 'package:flutter_project/ui/screen/home/home.dart';
import 'package:get/get.dart';

class ResultGetx extends GetxController {
  static ResultGetx get to => Get.find();

  String CorrectRate = '75.00%';

  void chagePage() {
    Get.to(const Home());
  }
}
