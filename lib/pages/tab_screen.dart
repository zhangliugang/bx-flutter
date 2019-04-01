import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'discover_page.dart';
import 'tab/search_page.dart';
import 'tab/path_page.dart';
import 'tab/board_page.dart';
import 'tab/account_page.dart';

class TabScreen extends StatelessWidget {
  final tabs = [DiscoverPage(), SearchPage(), PathPage(), BoardPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.directions), title: Text('Discover')),
          BottomNavigationBarItem(icon: Icon(Icons.unarchive), title: Text('Search')),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), title: Text('Path')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('Board')),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), title: Text('Account')),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        
        return CupertinoTabView(
          builder: (BuildContext context) {
            return tabs[index];
          },
        );
      },
    );
  }

  // List<Widget> tabs() {
  //   return [DiscoverPage(), SearchPage(), PathPage(), BoardPage(), AccountPage()];
  // }
}
