import 'package:flutter/material.dart';
import 'package:flutter_project/state/user/user_getx.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/screen/login/login.dart';
import 'package:flutter_project/ui/screen/userPage/seeDetail/detail.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../../repository/data/http_client.dart';
import '../../../utilities/logger.dart';

dynamic response;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> getData(UserPageGetx x) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs = await SharedPreferences.getInstance();
      var dio = Dio();
      print(prefs.getString("access_token"));
      dio.options.headers["Authorization"] =
          "Bearer ${prefs.getString("access_token")}";
      try {
        response = await dio.get(
          "${HttpClients.hostUrl}/api/user/get",
        );
        logger.d(response.data);
      } catch (error) {
        print(error);
      }
    }

    return GetBuilder<UserPageGetx>(
      init: UserPageGetx(),
      builder: (x) {
        return FutureBuilder(
          future: getData(x),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            userPageMiniTitle("회원정보"),
                            GestureDetector(
                              onTap: () {
                                x.changeUserInfo();
                              },
                              child: const Text(
                                "회원정보 수정",
                                style: TextStyle(
                                  color: AppColors.blueF3,
                                  fontFamily: "Pretendard",
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          userInfo("이름"),
                          const SizedBox(
                            width: 40.0,
                          ),
                          userValue(response.data['name'] ?? "빈값"),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          userInfo("소속"),
                          const SizedBox(
                            width: 40,
                          ),
                          userValue(response.data['belong'] ?? '무소속'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        indent: 0, //왼쪽 여백
                        endIndent: 0, // 오른쪽 여백
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          userPageMiniTitle("채점현황"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizCountWidget(
                          "맞힌문제", response.data['correctCount'], x, true),
                      const SizedBox(
                        height: 30,
                      ),
                      quizCountWidget(
                          "틀린문제", response.data['wrongCount'], x, false),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Future<void> logoutWithLoginPage() async {
                            // Save the tokens to shared preferences or any other storage method
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString('access_token', '');
                            prefs.setString("refresh_token", "");
                            Get.offAll(() => const Login());
                          }

                          logoutWithLoginPage();
                        },
                        child: Container(
                          width: 198,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.blueF3,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "로그아웃",
                              style: TextStyle(
                                color: AppColors.blueF4,
                                fontFamily: "Pretendard",
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Row quizCountWidget(String quiztype, int? count, UserPageGetx x, bool? a) {
    count ??= 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        userInfo(quiztype),
        Row(
          children: [
            const Text(
              "총 ",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "$count개",
              style: const TextStyle(
                fontFamily: "Pretendard",
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const Opacity(opacity: 0.0),
        GestureDetector(
          onTap: () {
            x.detailIsTrue(a);
            Get.to(const Errata());
          },
          child: const Text(
            "자세히보기",
            style: TextStyle(
              color: AppColors.blueF3,
              fontFamily: "Pretendard",
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Text userPageMiniTitle(String miniTitle) {
    return Text(
      miniTitle,
      style: const TextStyle(
        color: AppColors.darkGrayF1,
        fontSize: 22,
        fontFamily: "Pretendard",
      ),
    );
  }

  Text userValue(String value) => Text(
        value,
        style: const TextStyle(
          color: Color(0xFF000000),
          fontFamily: "Pretendard",
          fontSize: 16.0,
        ),
      );

  Text userInfo(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.darkGrayF3,
        fontFamily: "Pretendard",
        fontSize: 16.0,
      ),
    );
  }
}
