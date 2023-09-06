import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_project/mainpage.dart';
import 'package:get/get.dart';
import 'package:flutter_project/widgets/appbar.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 85, 40, 0),
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
                Text('정용명'),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                height: 0.6,
                width: 500.0,
                color: Colors.grey,
              ),
            ),
            Row(children: [
              Text('회원정보'),
              TextButton(
                  onPressed: () {
                    Get.to(MainPage());
                  },
                  child: Text('회원정보수정'))
            ]),
            Row(children: [
              Text('이름'),
              Text('정용명'),
            ]),
            Row(children: [
              Text('이메일'),
              Text('abc@abc.com'),
            ]),
            Row(children: [
              Text('연락처'),
              Text('010-0000-0000'),
            ]),
            Row(
              children: [
                Text('생년월일'),
                Text('2006.03.31'),
              ],
            ),
            Row(children: [
              Text('소속'),
              Text('부산소마고'),
            ]),
          ],
        ),
      ),
    );
  }
}
