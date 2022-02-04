import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_list_page.dart';
import 'package:news_app/ui/detail_page.dart';
import 'package:news_app/ui/settings_page.dart';
import 'package:news_app/widget/platform_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    ArticleListPage(),
    SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
      label: 'Headlines',
    ),
    BottomNavigationBarItem(
      icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavBarItems,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }
}
