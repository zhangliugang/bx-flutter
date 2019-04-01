import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showError(BuildContext context, String content) {
  showCupertinoDialog(context: context, builder: (BuildContext context) {
    return CupertinoAlertDialog(
      title: Icon(Icons.error, size: 60, color: Colors.red,),
      content: SingleChildScrollView(child: ListBody(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 13, bottom: 20),
          child: Text('Whoops...!', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        ),
        Text(content, style: TextStyle(fontSize: 13),)
      ],)),
      actions: <Widget>[
        CupertinoDialogAction(child: Text('OK'),
onPressed: (){Navigator.of(context).pop();},
        )
      ],
    );
  });
}
