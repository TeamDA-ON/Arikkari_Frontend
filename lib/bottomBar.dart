import 'package:flutter/material.dart';
import 'pages/mypage/mypage.dart';
import 'pages/analysis/analysis.dart';
import 'pages/home/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      tabController.animateTo(index);
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Analysis(),
    Mypage(),
  ];
  @override
  void initState() {
    tabController = TabController(length: _widgetOptions.length, vsync: this)
      ..addListener(() {
        print('setstate');
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '어휘분석',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        currentIndex: tabController.index,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
