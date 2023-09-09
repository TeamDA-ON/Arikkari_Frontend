import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_project/pages/home/home.dart';
import 'package:get/get.dart';
import 'package:flutter_project/widgets/constants/appbar.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 85, 40, 0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'assets/img/profile.jpg',
                    width: 90,
                    height: 90,
                  ),
                ),
                const Text('정용명'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                height: 0.6,
                width: 500.0,
                color: Colors.grey,
              ),
            ),
            Row(children: [
              const Text('회원정보'),
              TextButton(
                  onPressed: () {
                    Get.to(const Home());
                  },
                  child: const Text('회원정보수정'))
            ]),
            Row(children: const [
              Text('이름'),
              Text('정용명'),
            ]),
            Row(children: const [
              Text('이메일'),
              Text('abc@abc.com'),
            ]),
            Row(children: const [
              Text('연락처'),
              Text('010-0000-0000'),
            ]),
            Row(
              children: const [
                Text('생년월일'),
                Text('2006.03.31'),
              ],
            ),
            Row(children: const [
              Text('소속'),
              Text('부산소마고'),
            ]),
          ],
        ),
      ),
    );
  }
}
