import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/loginLogo.png',
                  height: 172.6,
                  width: 200.0,
                ),
                const Text(
                  "퀴즈로 늘리는 어휘력",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Pretendard',
                      fontSize: 34.0,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  '아리까리',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Pretendart',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // const LoginButtonWidget(
                //   ButtonColor: Colors.yellow,
                // ),
                // const LoginButtonWidget(
                //   ButtonColor: Colors.white,
                // )
                const SizedBox(
                  height: 160.0,
                ),
                loginButton(false, Colors.yellow, "카카오 로그인"),
                const SizedBox(
                  height: 10.0,
                ),
                loginButton(true, Colors.white, "구글로 로그인")
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector loginButton(bool border, Color color, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 350.0,
        height: 70.0,
        decoration: BoxDecoration(
            border: border
                ? Border.all(color: Colors.grey)
                : Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: color),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
