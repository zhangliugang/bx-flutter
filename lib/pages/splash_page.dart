import 'package:flutter/material.dart';
import 'package:boxue/i18n/AppLocalizations.dart';
import 'package:boxue/colors.dart';

import 'signin_widget.dart';
import 'sign_up_widget.dart';
import '../bloc/bloc_provider.dart';
import '../bloc/signin_bloc.dart';
import '../bloc/main_bloc.dart';

import 'tab_screen.dart';
import 'discover_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<MainBloc>(context);
    bloc.signIned.listen((next) {
      if (next) {
        _openSignInPage(context);
      } else {
        setState(() {
          _visible = true;
        });
      }
    });
    bloc.checkUserSession();
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(colors: [
      AppColors.appTitleGradientBegin,
      AppColors.appTitleGradientMid,
      AppColors.appTitleGradientEnd
    ], begin: Alignment.topLeft, end: Alignment.centerRight)
        .createShader(Rect.fromLTWH(0, 0, 300, 90));

    Widget app_title = Text(
      AppLocalizations.of(context).app_title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 34,
          foreground: Paint()..shader = linearGradient),
    );

    Widget app_slogan = Text(
      AppLocalizations.of(context).app_slogan,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
    );

    return Scaffold(
        body: SizedBox.expand(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(
                      'assets/images/LaunchScreen_iPhoneX_dark.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 140),
                        width: 300,
                        height: 90,
                        child: app_title),
                    Container(
                        margin: EdgeInsets.only(top: 40), child: app_slogan)
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: 300,
                  child: Text(
                    AppLocalizations.of(context).rights_info,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.lightGray3, fontSize: 14),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 55,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 1000),
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            child: Text(
                              AppLocalizations.of(context).signin,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onPressed: () {
                              _openSignInPage(context);
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        FlatButton(
                          child: Text(
                            AppLocalizations.of(context).browse_now,
                            style: TextStyle(color: AppColors.labelBtnYellow),
                          ),
                          onPressed: () {
                            _openMain(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  void _openSignInPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(bloc: SignInBloc(), child: SignInPage(),)));
  }

  void _openMain(BuildContext context) {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DiscoverPage()));
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (BuildContext context, Animation animation, __) {
          return FadeTransition(
            child: DiscoverPage(),
            opacity: animation,
          );
        }));
  }
}
