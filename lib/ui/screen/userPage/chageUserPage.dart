import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/state/user/user_getx.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/screen/userPage/userPage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/data/http_client.dart';
import '../../../utilities/logger.dart';

class UserInfoChagePage extends StatefulWidget {
  const UserInfoChagePage({super.key});

  @override
  State<UserInfoChagePage> createState() => _UserInfoChagePageState();
}

class _UserInfoChagePageState extends State<UserInfoChagePage> {
  void putData(UserPageGetx x) async {
    print(x.controllName.text);
    var dio = Dio();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs = await SharedPreferences.getInstance();
      dio.options.headers["Authorization"] =
          "Bearer ${prefs.getString("access_token")}";
      dynamic response = await dio.put("${HttpClients.hostUrl}/api/user/update",
          data: {"name": x.controllName.text, "belong": x.controllSchool.text});
      logger.d(response.statusCode);
      print("put함");
      Get.to(const UserPage());
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPageGetx>(builder: (x) {
      return Scaffold(
        backgroundColor: AppColors.darkGrayF2,
        body: Center(
          child: Container(
            width: Get.width * 0.8,
            height: Get.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height * 0.4,
                child: Center(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "회원정보 수정",
                          style: TextStyle(
                            fontFamily: "Pretandard",
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        userInputChange(x.controllName, "이름"),
                        userInputChange(x.controllSchool, "소속"),
                        SizedBox(
                          height: Get.height * 0.06,
                        ),
                        //변경하기 버튼
                        GestureDetector(
                          onTap: () {
                            putData(x);
                          },
                          child: Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.blueF3,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "변경하기",
                                style: TextStyle(
                                  color: AppColors.blueF4,
                                  fontFamily: "Pretendard",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Row userInputChange(
    TextEditingController controller,
    String lowName,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          lowName,
          style: const TextStyle(
              color: AppColors.darkGrayF3,
              fontFamily: "Pretandard",
              fontSize: 16.0),
        ),
        SizedBox(
          height: Get.height * 0.05,
        ),
        Container(
          width: 200.0,
          height: 20,
          margin: EdgeInsets.only(left: Get.width * 0.1),
          child: TextField(
            style: const TextStyle(
              fontFamily: "Pretandard",
              fontSize: 16.0,
              color: AppColors.darkGrayF3,
            ),
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
