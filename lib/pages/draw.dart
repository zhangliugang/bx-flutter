import 'package:flutter/material.dart';
import 'setting_page.dart';
import 'paint_page.dart';

class DiscoverDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverDrawerState();
}

class _DiscoverDrawerState extends State<DiscoverDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(0), children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Boxue'),
          accountEmail: Text('test@boxue.io'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "B",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('Setting'),
          onTap: (){
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.motorcycle),
          title: Text('Draw'),
          onTap: (){
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintPage()));
          },
        )
      ]),
    );
  }
}
