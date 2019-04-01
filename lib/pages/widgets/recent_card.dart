import 'package:flutter/material.dart';

class RecentCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecentCard();
}

class _RecentCard extends State<RecentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.zero,
      child: Stack(
          children: <Widget>[
            Positioned(
              left: 16.0,
              bottom: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 248.0,
                    child: Text('RxSwift - Scheduler是如何完成调度的 II', maxLines: 2, style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white
                    ),),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('2018/05/01', style: TextStyle(
                      fontSize: 13, color: Colors.white
                    ),),
                  )
                ],
            ),),
            Positioned(
              right: 16.0,
              bottom: 16.0,
              child: Icon(Icons.play_arrow, color: Colors.white,),
            )
          ],
        ),
      
    );
  }
}