import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import "package:flutter_project/ui/screen/userPage/chageUserPage.dart";

class UserPageGetx extends GetxController {
  static UserPageGetx get to => Get.find();
  String test = "test data";

  void changeUserInfo() {
    Get.to(() => const UserInfoChagePage());
  }

  TextEditingController controllName = TextEditingController();
  TextEditingController controllSchool = TextEditingController();
}
