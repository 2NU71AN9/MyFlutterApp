import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/home/page_home.dart';
import 'pages/discover/page_discover.dart';
import 'pages/profile/page_profile.dart';
import 'package:my_flutter_app/services/user_data_service.dart';

class TabBarCtr extends StatefulWidget {
  const TabBarCtr({Key? key}) : super(key: key);

  @override
  _TabBarCtrState createState() => _TabBarCtrState();
}

class _TabBarCtrState extends State<TabBarCtr> {
  List<Widget> _pageList = [HomePage(), DiscoverPage(), ProfilePage()];

  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("images/tab1_normal.png"),
              label: "首页",
              activeIcon: Image.asset("images/tab1_selected.png")),
          BottomNavigationBarItem(
              icon: Image.asset("images/tab2_normal.png"),
              label: "发现",
              activeIcon: Image.asset("images/tab2_selected.png")),
          BottomNavigationBarItem(
              icon: Image.asset("images/tab3_normal.png"),
              label: "我的",
              activeIcon: Image.asset("images/tab3_selected.png"))
        ],
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
    );
  }
}
