import 'package:flutter/material.dart';
import 'package:flutter_project/ui/_constant/theme/app_colors.dart';
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
        body: Center(
          child: Column(
            children: <Widget>[
              const Spacer(
                flex: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.2,
                constraints: const BoxConstraints(
                    minHeight: 170,
                    minWidth: 170,
                    maxWidth: 400,
                    maxHeight: 400),
                child: Center(
                  child: Image.asset('assets/img/loginLogo.png'),
                ),
              ),
              const Text(
                '퀴즈로 늘리는 어휘력',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                ),
              ),
              const Text(
                '아리까리',
                style: TextStyle(
                  color: Color(0xFF9b9b9b),
                  fontSize: 24,
                ),
              ),
              const Spacer(
                flex: 13,
              ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.basic_grayF2,
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "구글 로그인",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrayF1,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
