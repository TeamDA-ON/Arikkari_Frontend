import 'package:flutter/material.dart';
import 'package:get/get.dart';

Stack voca_QuizContainer({
  required String? difficulty,
  required String? problem,
  required int? answer,
  required String? commentary,
  required RxInt progressNumber,
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
                      value: 0.1,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ),
                Text(
                  '$progressNumber/5',
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
                children: [
                  problemTextMethod(problem),
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
    ],
  );
}

Container problemTextMethod(String? problemText) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    child: Text(
      problemText ?? '', // 가져온 데이터의 일부를 표시
      style: const TextStyle(
        fontSize: 32,
      ),
    ),
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
