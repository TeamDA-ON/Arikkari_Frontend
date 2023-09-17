import 'package:flutter/material.dart';

class Voca extends StatefulWidget {
  const Voca({super.key});

  @override
  State<Voca> createState() => _VocaState();
}

class _VocaState extends State<Voca> {
  String difficulty = '중';

  void quizAnswer(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeff0f0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          // color: const Color(0xFFeff0f0),
          width: double.maxFinite,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              primary: false,
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
                        height: MediaQuery.of(context).size.height * 0.5,
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
                                  width: 200,
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
                              ],
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                            ),
                            Center(
                              child: Wrap(
                                children: const [
                                  Text(
                                    '사물을 어림잡아 해아림',
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
                      Positioned(
                        top: -30,
                        left: 10,
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('난이도 : $difficulty'),
                            ],
                          ),
                        ),
                      ),
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
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Column(
                    children: [
                      button(context, "통찰", false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      button(context, "분석", false),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      button(context, "가늠", true),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox button(BuildContext context, String a, var b) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * 0.8,
      height: 52,
      child: OutlinedButton(
          onPressed: () {
            b ? print("정답") : print("오답");
          },
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          child: Text(a)),
    );
  }
}
