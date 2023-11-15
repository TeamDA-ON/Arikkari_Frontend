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
      !x.detailIsTrue.value
          ? response = await dio.get(
              "${HttpClients.hostUrl}/api/wrong/list",
            )
          : response = await dio.get(
              "${HttpClients.hostUrl}/api/correct/list",
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
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              x.detailIsTrue.value
                                  ? Image.asset("assets/img/collect.png")
                                  : Image.asset("assets/img/wrong.png"),
                              const SizedBox(
                                width: 5,
                              ),
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
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      for (var data in quizColume)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data["answer"],
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkGrayF1,
                                        fontFamily: "Pretendard",
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.01,
                                    ),
                                    Text(
                                      "∙ ${data["questionType"] == "MCQ" ? "어휘" : "맞춤법"}",
                                      style: const TextStyle(
                                        color: AppColors.blueF3,
                                        fontSize: 12,
                                        fontFamily: "Pretendard",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width - 40,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.yellow,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      data["define"].contains("<error>")
                                          ? data["description"]
                                          : data["define"],
                                      style: const TextStyle(
                                        color: AppColors.darkGrayF2,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.clip,
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
              ),
            );
          }
        },
      );
    });
  }
}
