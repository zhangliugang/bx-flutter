import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: SizedBox(
        width: 350,
        height: 350,
        child: UiKitView(viewType: 'VideoView'),
      ),
    );
  }
}
