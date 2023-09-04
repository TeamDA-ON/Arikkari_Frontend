import 'package:flutter/material.dart';

class quizSelection extends StatelessWidget {
  const quizSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                children: const [
                  Text(
                    '맞춤법 퀴즈',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '문장을 듣고 빈칸을 채워 맞춤법을 공부해요.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
