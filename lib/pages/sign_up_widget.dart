import 'package:flutter/material.dart';
import 'package:boxue/i18n/AppLocalizations.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).contact_us),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: Text('Sign Up')),
    );
  }
  
}