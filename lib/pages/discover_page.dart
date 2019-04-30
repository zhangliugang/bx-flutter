import 'package:flutter/material.dart';
import 'dart:math';
import 'tab/account_page.dart';
import 'draw.dart';
import 'widgets/recent_card.dart';
import 'widgets/history_card.dart';
import 'video_page.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _colors = [
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.blue,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discovery'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.dehaze),
              color: Colors.white,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: (){
              showSearch(context: context, delegate:DataSearch());
            },
          )
        ],
      ),
      drawer: DiscoverDrawer(),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 16),
              child: Text(
                'Recent Update',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 190,
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      child: RecentCard(),
                      onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPage()));
                      },
                      ),//Center(child: Text('$index')),
                    width: 336,
                    height: 190,
                    // color: _colors[Random().nextInt(_colors.length)],
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.only(left: 16, top: 16),
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(top: 11, bottom: 12, left: 16),
              child: Text(
                'Watching History',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 146,
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: HistoryCard(),
                    width: 144,
                    height: 146,
                    
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              margin: EdgeInsets.only(left: 16, top: 16),
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(top: 11, bottom: 12, left: 16),
              child: Text(
                'Learning Path',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 140,
              width: double.infinity,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8.0),
                    child: Center(child: Text('$index')),
                    width: 100,
                    height: 140,
                    color: _colors[Random().nextInt(_colors.length)],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DataSearch extends SearchDelegate<String> {
  final cities = [
    'RxSwift中的那些“术语”到底在说什么？',
    '为什么RxSwift也需要flatMap',
    'RxSwift - 重构获取天气数据的流程 ',
    'RxSwift - 基于Trait改进UI相关的代码 ',
    'RxSwift - 如何扩展RxCocoa',
    'RxSwift - 在Sky添加处理错误的交互 '
  ];

  final recentCities = [
    'RxSwift', 
    'MVVM + Coordinator', 
    'Swift学习', 
    'Machine Learning',
    'Vim快捷键'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = '';
        showSuggestions(context);
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,), 
        onPressed: (){
          close(context, 'result');
        }
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    // search results
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // shwo when someone searchs for something
    final suggestionList = query.isEmpty?recentCities:cities.where((s)=>s.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) { 
        return ListTile(
          leading: Icon(Icons.search),
          title: Text(suggestionList[index]), onTap: (){
          query =suggestionList[index];
showResults(context);
        },);
      },
      itemCount: suggestionList.length,
    );
  }

}