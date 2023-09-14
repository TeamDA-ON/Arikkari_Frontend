import 'package:flutter/material.dart';

import 'package:flutter_project/widgets/constants/appbar.dart';

class Analysis extends StatefulWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: const Color.fromRGBO(120, 120, 120, 1),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 85, 20, 40),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 10,
            child: SizedBox(
              width: double.maxFinite,
              height: 380,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 85, 20, 40),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/img/analysis.png',
                        width: 120,
                        height: 120,
                      ),
                      const Text('준비중'),
                      const Text('아직 제공되지 않는 기능입니다.'),
                      const Text('잠시만 기다려 주세요.')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
