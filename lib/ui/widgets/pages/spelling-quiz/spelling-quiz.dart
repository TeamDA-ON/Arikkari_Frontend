import 'package:flutter/material.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
import 'package:get/get.dart';

Stack spelling_QuizContainer({
  required int quizCount,
  required String? answer,
  required String? problem1,
  required String? problem2,
  required String commentary,
  required TextEditingController? editController,
  required String? difficulty,
  required RxString? answerIsCollect,
  required Function() ttsTap,
  required Function() checkAnswer,
  required bool isLoading,
}) {
  // print(isLoading);
  // if (!isLoading) {
  //   ttsTap();
  // }
  if (answerIsCollect == "Normal") {
    ttsTap();
  }
  return Stack(
    clipBehavior: Clip.none,
    // overflow: Overflow.visible,
    children: [
      answerIsCollect == "notCollect"
          ? Container(
              width: Get.width,
              height: (Get.height * 0.45) + 90,
              decoration: const BoxDecoration(
                color: Color(0xFFFEE500),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
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
              ),
            )
          : SizedBox(
              width: Get.width,
              height: (Get.height * 0.4) + 90,
            ),
      Container(
        // width: MediaQuery.of(context).size.width * 0.8,
        height: Get.height * 0.4,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(30),
          borderRadius: answerIsCollect == "notCollect"
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              : BorderRadius.circular(30),
          boxShadow: answerIsCollect == "notCollect"
              ? null
              : [
                  const BoxShadow(
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
                  margin: const EdgeInsets.only(right: 5),
                  width: 190,
                  height: 9.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: (quizCount * 0.2).toDouble(),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xff00ff00)),
                      backgroundColor: const Color(0xffD6D6D6),
                    ),
                  ),
                ),
                Text('$quizCount/5'),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: ttsTap,
                    child: Image.asset(
                      "assets/img/volume.png",
                      width: 25.0,
                      height: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Divider(
                height: 1,
                thickness: 1,
                endIndent: 0.5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Wrap(
                children: [
                  problemTextMethod(problem1 ?? ""),
                  Container(
                    width: 100.0,
                    height: 70.0,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      // inputFormatters: [LengthLimitingTextInputFormatter(MAXLENGTH)], //입력길이 제한
                      autofocus: true,
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                      controller: editController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFE7E7E7),
                      ),
                    ),
                  ),
                  problemTextMethod(problem2 ?? ""),
                ],
              ),
            ),
          ],
        ),
      ),
      // 확인버튼
      if (answerIsCollect == "Normal")
        boxPosition(
          null, //top
          70, //bottom
          null, // left
          10, // right
          GestureDetector(
            onTap: () {
              checkAnswer();
            },
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
              color: const Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                quizText(
                  '난이도 : $difficulty',
                  const Color(0xFF404040),
                ),
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
              quizText(
                "듣고 빈칸을 채워주세요",
                const Color(0XFFEFF0F0),
              ),
            ],
          ),
        ),
      ),

      // 정답 오답 표시 표
      if (answerIsCollect != "Normal")
        boxPosition(
            50,
            null,
            Get.width * 0.5 - 100,
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
                  ))
    ],
  );
}

Container problemTextMethod(String problemText) {
  return Container(
    margin: const EdgeInsets.only(top: 3),
    child: Text(
      problemText, // 가져온 데이터의 일부를 표시
      style: const TextStyle(
        fontSize: 28,
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
