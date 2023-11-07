import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
              body: const Text("테스트"),
            );
          }
        },
      );
    });
  }
}
