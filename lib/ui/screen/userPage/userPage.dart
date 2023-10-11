import 'package:flutter/material.dart';
import 'package:flutter_project/state/user/user_getx.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPageGetx>(
      init: UserPageGetx(),
      builder: (x) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("회원 정보"),
            elevation: 0.0,
          ),
          body: Column(
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("회원정보"),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "회원정보 수정",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: const [
                  Text("이름"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("이름임"),
                ],
              ),
              Row(
                children: const [
                  Text("소속"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("소속임"),
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 0, //왼쪽 여백
                endIndent: 0, // 오른쪽 여백
              ),
              const Text("채점현황"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('맞힌문제'),
                  const Text("무튼갯수"),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("자세히보기"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('틀린문제'),
                  const Text("무튼갯수"),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("자세히보기"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
