import 'package:flutter/material.dart';
import 'package:get/get.dart';

Stack solveQuizContainer({
  // 파라미터
  required bool? isTypeSpelling, //스펠인지 아닌지 확인
  required Function? ttsTap,
  required String? problemText,
  required TextEditingController? editController,
  required String? difficulty,
  // required Rx<Spelling_Quiz>? difficulty,
  required Function() submit,
}) {
  return Stack(
    clipBehavior: Clip.none,
    // overflow: Overflow.visible,
    children: [
      Container(
        // width: MediaQuery.of(context).size.width * 0.8,
        height: Get.height * 0.4,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 20, 10, 20),
                  width: 190,
                  height: 9.5,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ),
                const Text('4/20'),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: ttsTap!(),
                    child: Image.asset(
                      "assets/img/volume.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
              endIndent: 0.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    problemText!, // 가져온 데이터의 일부를 표시
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 9),
                    width: 100,
                    height: 35,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    child: TextField(
                      autofocus: true,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      controller: editController!,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFE7E7E7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      boxPosition(
          -25,
          null,
          0,
          null,
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: const Color(0xFF92dcec),
                ),
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFFFFFFFF)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                quizText('난이도 : $difficulty', const Color(0xFF404040)),
              ],
            ),
          )),
      boxPosition(
        -25,
        null,
        null,
        0,
        Container(
          width: 200,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              quizText("듣고 빈칸을 채워주세요", const Color(0XFFEFF0F0)),
            ],
          ),
        ),
      ),
      if (isTypeSpelling!)
        boxPosition(
          null, //top
          -30, //bottom
          null, // left
          10, // right
          GestureDetector(
            onTap: submit,
            child: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFf4f4f4),
                border: Border.all(color: const Color(0xFFD9D9D9), width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "확인",
                    style: TextStyle(
                      letterSpacing: 5,
                      color: Color(
                        0xFF7A7A7A,
                      ),
                      fontSize: 22.0,
                      fontFamily: "Pretendard",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    ],
  );
}

Text quizText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'Pretendard',
    ),
  );
}

Positioned boxPosition(
    double? top, double? bottom, double? left, double? right, Widget widget) {
  return Positioned(
    top: top,
    left: left,
    bottom: bottom,
    right: right,
    child: widget,
  );
}
