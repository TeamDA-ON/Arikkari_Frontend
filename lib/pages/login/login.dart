import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Center(
                  child: Opacity(
                    opacity: 0.0,
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/img/loginLogo.png',
                      height: 172.6,
                      width: 200.0,
                    ),
                    logoText(
                        "퀴즈로 늘리는 어휘력", Colors.black, FontWeight.w600, 34.0),
                    logoText("아리까리", Colors.grey, FontWeight.w500, 28.0),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      loginButton(false, Colors.yellow, "카카오 로그인", () {}),
                      const SizedBox(
                        height: 16.0,
                      ),
                      loginButton(true, Colors.white, "구글로 로그인", () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container logoText(String text, Color color, FontWeight weight, double size) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontFamily: 'Pretendard',
            fontSize: size,
            fontWeight: weight),
      ),
    );
  }

  GestureDetector loginButton(
      bool border, Color color, String text, Callback onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 350.0,
        height: 70.0,
        decoration: BoxDecoration(
            border: border
                ? Border.all(color: Colors.grey)
                : Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: color),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: 'Pretendard',
            ),
          ),
        ]),
      ),
    );
  }
}
