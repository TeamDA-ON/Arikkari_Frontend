import 'package:flutter/material.dart';
import 'package:flutter_project/pages/analysis/analysis.dart';
import 'package:flutter_project/pages/chosequiz/chosequiz.dart';
import 'package:flutter_project/pages/information/information.dart';
import 'package:get/get.dart';
import 'package:flutter_project/widgets/appbar.dart';


class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 85, 20, 40),
        child: Column(
          children: [
            _profileWidget(),
            _comprensiveSection(),
            logoutButton(),
          ],
        ),
      ),
    );
  }

  Padding logoutButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
      child: SizedBox(
        width: 200,
        height: 57,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("로그아웃"),
        ),
      ),
    );
  }

  Padding _comprensiveSection() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(1, 45, 1, 1),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.grey, width: 0)),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {Get.to(const ChoseQuiz());},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/quiz.png',
                        width: 40,
                        height: 40,
                      ),
                      const Text("퀴즈 풀기")
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {Get.to(Analysis());},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/analysis2.png',
                        width: 40,
                        height: 40,
                      ),
                      const Text("어휘 분석")
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Get.to(const Information());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/modify.png',
                        width: 40,
                        height: 40,
                      ),
                      const Text("정보 수정"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Row _profileWidget() {
    return Row(
      children: [
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(50, 1, 1, 1),
              child: Text("반갑습니다"),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 1, 1), child: Text("정용명님"))
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(140, 1, 1, 1),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(color: Colors.grey, width: 1)),
            width: 136,
            height: 136,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.asset(
                'assets/img/profile.jpg',
                width: 136,
                height: 136,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
