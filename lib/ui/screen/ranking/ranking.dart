import 'package:flutter/material.dart';
import 'package:flutter_project/ui/widgets/constants/appbar.dart';
import 'package:flutter_project/ui/widgets/pages/Ranking/playerRanking.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/utilities/logger.dart';
import 'package:flutter_project/repository/data/http_client.dart';

class Ranking extends StatefulWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  late List<Map<String, dynamic>> rankingData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var dio = Dio();
    try {
      final response = await dio.get('${HttpClients.hostUrl}/api/user/ranking');

      setState(() {
        rankingData = List<Map<String, dynamic>>.from(response.data);
      });

      logger.d(response.data);
    } catch (error) {
      print('에러 :: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(44, 24, 44, 0),
        child: Column(
          children: [
            for (var data in rankingData)
              playerRanking(
                belong: data['belong'] ?? '무소속',
                name: data['name'],
                ranking: '${rankingData.indexOf(data) + 1}',
                score: '${data['point']}',
              ),
          ],
        ),
      ),
    );
  }
}
