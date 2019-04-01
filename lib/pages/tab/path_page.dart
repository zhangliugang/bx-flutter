import 'package:flutter/material.dart';

class PathPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PathPageState();
  
}

class _PathPageState extends State<PathPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PATH'),
      ),
      body: Center(
        child: Text('PATH'),
      ),
    );
  }

}