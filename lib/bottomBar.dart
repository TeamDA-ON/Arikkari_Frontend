import 'package:flutter/material.dart';
import 'package:flutter_project/ui/screen/home/home.dart';
import 'package:flutter_project/ui/screen/ranking/ranking.dart';
import 'package:flutter_project/ui/screen/userPage/userPage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
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
    const Ranking(),
    const UserPage()
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
            icon: Icon(Icons.bar_chart),
            label: '랭킹페이지',
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
