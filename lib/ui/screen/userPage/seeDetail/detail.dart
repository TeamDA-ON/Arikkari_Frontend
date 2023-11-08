import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:flutter_project/ui/widgets/constants/appbar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/data/http_client.dart';
import '../../../../state/user/user_getx.dart';
import '../../../../utilities/logger.dart';

class Errata extends StatefulWidget {
  const Errata({super.key});

  @override
  State<Errata> createState() => _Errata();
}

dynamic response;

class _Errata extends State<Errata> {
  List<Map<String, dynamic>> quizColume = [];
  @override
  Widget build(BuildContext context) {
    Future<void> getData(UserPageGetx x) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs = await SharedPreferences.getInstance();
      var dio = Dio();
      dio.options.headers["Authorization"] =
          "Bearer ${prefs.getString("access_token")}";
      response = await dio.get(
        "${HttpClients.hostUrl}/api/wrong/list",
      );
      logger.d(response.data);
      quizColume = List<Map<String, dynamic>>.from(response.data);
    }

    return GetBuilder<UserPageGetx>(builder: (x) {
      return FutureBuilder(
        future: getData(x),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return Scaffold(
              appBar: appBar(),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        x.detailIsTrue.value
                            ? Image.asset("assets/img/collect.png")
                            : Image.asset("assets/img/wrong.png"),
                        Text(
                          x.detailIsTrue.value ? "맞은 문제" : "틀린문제",
                          style: const TextStyle(
                            fontFamily: "Pretendard",
                            color: AppColors.darkGrayF3,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    // for (var data in quizColume)
                    Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "이걸 틀리리네",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkGrayF1,
                                    fontFamily: "Pretendard",
                                  ),
                                ),
                                Text(
                                  "∙ 맞춤법",
                                  style: TextStyle(
                                    color: AppColors.blueF3,
                                    fontSize: 12,
                                    fontFamily: "Pretendard",
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "더 알아보기",
                              style: TextStyle(
                                color: AppColors.basic_grayF2,
                                fontSize: 12,
                                fontFamily: "Pretendard",
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: Get.width * 0.7,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.yellow,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "해설같은거",
                                  style: TextStyle(
                                    color: AppColors.darkGrayF2,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: "Pretendard",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        },
      );
    });
  }
}
