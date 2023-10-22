import 'package:flutter/material.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:get/get.dart';

Stack voca_QuizContainer({
  required String? difficulty,
  required String? problem,
  required int? answer,
  required String commentary,
  required RxInt progressNumber,
  required RxString? answerIsCollect,
}) {
  return Stack(
    clipBehavior: Clip.none,
    // overflow: Overflow.visible,
    children: [
      if (answerIsCollect == "notCollect")
        Container(
            width: Get.width,
            height: (Get.height * 0.4) + 80,
            decoration: const BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    commentary,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 16.0,
                      color: AppColors.darkGrayF2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )),
      Container(
        // width: MediaQuery.of(context).size.width * 0.8,
        height: Get.height * 0.4,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              answerIsCollect == "Normal" || answerIsCollect == "collect"
                  ? const BorderRadius.all(
                      Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(30),
                    ),
          boxShadow: answerIsCollect != 'notCollect'
              ? [
                  const BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                ]
              : null,
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
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: (progressNumber * 0.2).toDouble(),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff00ff00)),
                      backgroundColor: const Color(0xffD6D6D6),
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
      if (answerIsCollect != "Normal")
        //   {
        boxPosition(
          50,
          null,
          (Get.width * 0.5 - 100.0),
          null,
          answerIsCollect == "collect"
              ? Container(
                  height: 148,
                  width: 148,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/img/vMark.png",
                      width: 96.82,
                      height: 96.82,
                    ),
                  ),
                )
              : Container(
                  height: 148,
                  width: 148,
                  decoration: const BoxDecoration(
                    color: AppColors.red1,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/img/xMark.png",
                    width: 96.82,
                    height: 96.82,
                  ),
                ),
        )
      // },
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
