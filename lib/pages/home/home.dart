import 'package:flutter/material.dart';
import 'package:flutter_project/pages/choseQuiz/chosequiz.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizStart(),
    );
  }
}

class QuizStart extends StatefulWidget {
  const QuizStart({super.key});

  @override
  State<QuizStart> createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  String todayWorld = 'baek';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          primary: false,
          child: Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  'assets/img/homeLogo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const buildTitle(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                IconButton(
                  onPressed: () {
                    Get.to(const ChoseQuiz());
                  },
                  iconSize: 99,
                  icon: Image.asset(
                    'assets/img/start.png',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Stack(clipBehavior: Clip.none, 
                alignment: Alignment.center,
                children: [
                buildStartButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Stack(clipBehavior: Clip.none, alignment: Alignment.center,children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          todayWorld,
                          style: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -32.5,
                    child: Container(
                      width: 210,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5.0,
                              offset: const Offset(0, 10),
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '오늘의 단어',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ],),
        ),
      ),),
    );
  }

  SizedBox buildStartButton() {
    return SizedBox(
      width: 99,
      height: 99,
      child: IconButton(
        onPressed: () {
          Get.to(const ChoseQuiz());
        },
        icon: Image.asset(
          'assets/img/start.png',
          width: 99,
          height: 99,
        ),
      ),
    );
  }
}

class buildTitle extends StatelessWidget {
  const buildTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '퀴즈 풀러가기',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 32,
      ),
    );
  }
}
