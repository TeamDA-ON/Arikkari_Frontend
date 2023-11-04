import 'package:flutter/material.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_project/ui/screen/home/home.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Webview extends StatefulWidget {
  const Webview({Key? key}) : super(key: key);

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future<void> navigateToHome(String accessToken, String refreshToken) async {
    // Save the tokens to shared preferences or any other storage method
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
    prefs.setString('refresh_token', refreshToken);
    Get.offAll(() => const Home());
  }

  @override
  Widget build(BuildContext context) {
    const authUrl =
        'https://accounts.google.com/o/oauth2/v2/auth?client_id=415045963497-6a4h12l94ovshlq70jmfjlh3susd8g91.apps.googleusercontent.com&redirect_uri=https://port-0-arikkari-backend-euegqv2blnrdvf3e.sel5.cloudtype.app/login/oauth2/code/google&response_type=code&scope=email profile';
    return MaterialApp(
      home: Scaffold(
        body: WebView(
          initialUrl: authUrl,
          userAgent: "random",
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          navigationDelegate: (NavigationRequest request) async {
            if (request.url.startsWith(
                'https://port-0-arikkari-backend-euegqv2blnrdvf3e.sel5.cloudtype.app')) {
              var urlParameters = Uri.parse(request.url).queryParameters;
              var code = urlParameters['code'];
              var scope = urlParameters['scope'];
              var authuser = urlParameters['authuser'];
              var prompt = urlParameters['prompt'];

              if (code != null &&
                  scope != null &&
                  authuser != null &&
                  prompt != null) {
                Uri uri = Uri.parse(
                    "https://port-0-arikkari-backend-euegqv2blnrdvf3e.sel5.cloudtype.app/api/auth/signup?code=$code&scope=$scope&authuser=$authuser&prompt=$prompt");
                logger.d(uri);

                var response = await http.post(uri);

                logger.d(response.body);

                // Extract the access token and refresh token from the response

                final Map<String, dynamic> responseData =
                    jsonDecode(response.body);
                final String accessToken = responseData['access_token'];
                final String refreshToken = responseData['refresh_token'];

                await navigateToHome(accessToken, refreshToken);
              }
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }
}
