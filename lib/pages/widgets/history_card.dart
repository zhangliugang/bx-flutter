import 'package:flutter/material.dart';

class HistoryCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Image.network('src'),
        Container(color: Colors.black,  height: 81.0,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: <Widget>[
            Icon(Icons.watch, size: 16.0,),
            Text('16:01 2018-07-11', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54))
          ],),
        ),
        Text('RxSwift - 一个Scheduler会失灵的场景', style: TextStyle(
          fontSize: 12.0,
          color: Colors.black
        ), maxLines: 2,)
      ],
    );
  }
}