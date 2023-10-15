import 'package:flutter/material.dart';
import 'package:flutter_project/ui/widgets/constants/appbar.dart';
import 'package:flutter_project/ui/widgets/pages/Ranking/playerRanking.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(44, 24, 44, 0),
        child: Column(
          children: [
            playerRanking(
                belong: '무소속', name: '김강민', ranking: '1', score: '400'),
            playerRanking(
                belong: '무소속', name: '박강인', ranking: '2', score: '300'),
            playerRanking(
                belong: '무소속', name: '권강빈', ranking: '3', score: '200'),
            playerRanking(
                belong: '무소속', name: '우수지', ranking: '4', score: '100')
          ],
        ),
      ),
    );
  }
}
