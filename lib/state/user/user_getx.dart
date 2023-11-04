import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import "package:flutter_project/ui/screen/userPage/chageUserPage.dart";

class UserPageGetx extends GetxController {
  static UserPageGetx get to => Get.find();
  RxString email = "".obs;
  RxString name = "익명".obs;
  RxString belong = "".obs;
  RxInt correctCount = 0.obs;
  RxInt wrongCount = 0.obs;

  void changeUserInfo() {
    Get.to(() => const UserInfoChagePage());
  }

  TextEditingController controllName = TextEditingController();
  TextEditingController controllSchool = TextEditingController();
}
