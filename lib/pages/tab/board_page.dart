import 'package:flutter/material.dart';

class BoardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BoardPageState();

}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Board'),
      ),
      body: Center(
        child: Text('Board'),
      ),
    );
  }

}