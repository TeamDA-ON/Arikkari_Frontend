import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_project/model/model_quiz.dart';
import 'package:get/get.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class QuizController extends GetxController {
  final quiz =
      Spelling_Quiz(answer: '', description: '', difficulty: null, problem: '')
          .obs;

  Future<void> getData() async {
    try {
      Dio dio = Dio();
      var response = await dio.get('http://localhost:8080/question/api/get/3');
      quiz.value = Spelling_Quiz.fromMap(response.data);
      print(quiz.value.answer);
    } catch (error) {
      print(error);
    }
  }
}

class _QuizState extends State<Quiz> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditController = TextEditingController();
  final QuizController quizController = Get.put(QuizController());

  @override
  void dispose() {
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // quizController.getData();
    return Scaffold(
      resizeToAvoidBottomInset: false, //키보드에 가려지는 위젯이 생길때 오버플로우 방지해주는 코드
      backgroundColor: const Color(0xFFeff0f0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          // color: const Color(0xFFeff0f0),
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Stack(
                clipBehavior: Clip.none,
                // overflow: Overflow.visible,
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),

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
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(25, 20, 10, 20),
                              width: 190,
                              height: 9.5,
                              child: const ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: 0.7,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff00ff00)),
                                  backgroundColor: Color(0xffD6D6D6),
                                ),
                              ),
                            ),
                            const Text('4/20'),
                            IconButton(
                              iconSize: 10,
                              onPressed: () async {
                                var result = await flutterTts.speak("영준아.");
                              },
                              icon: Image.asset('assets/img/volume.png'),
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
                              Obx(() => Text(
                                    quizController
                                        .quiz.value.problem, // 가져온 데이터의 일부를 표시
                                    style: const TextStyle(fontSize: 20),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: 100,
                                height: 35,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                child: TextField(
                                  autofocus: true,
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                  controller: textEditController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Color(0xFFE7E7E7),
                                  ),
                                ),
                              ),
                              const Text(
                                '?',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  boxPosition(),
                  Positioned(
                    top: -30,
                    right: 10,
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '듣고 빈칸을 채워주세요.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: ElevatedButton(
                          onPressed: onSubmit,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          child: const Text('다음')))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Image.asset(
                'assets/img/quizlogo.png',
                width: 120,
                height: 120,
                color: const Color(0xFF000000).withOpacity(0.08),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned boxPosition() {
    return Positioned(
      top: -30,
      left: 10,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: const Color(0xFF92DCEC),
            ),
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFFFFFFFF)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('난이도 : ${quizController.quiz.value.difficulty}'),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    quizController.getData();
    String textResult = textEditController.text.trim();
    print('textResult : $textResult');
    if (textResult == quizController.quiz.value.answer) {
      print('정답');
    } else {
      print('오답');
    }
  }
}
