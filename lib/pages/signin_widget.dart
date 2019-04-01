import 'package:flutter/material.dart';
import 'package:boxue/i18n/AppLocalizations.dart';
import '../colors.dart';
import '../bloc/signin_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:boxue/util/dialog.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  SignInBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = SignInBloc();
  }

  @override
  Widget build(BuildContext context) {
    final Widget emailInput = TextField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).email,
        prefixIcon: Icon(Icons.email),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      onChanged: bloc.onEmailChanged.add,
    );

    final Widget passwordInput = TextField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).password,
        prefixIcon: Icon(Icons.security),
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: bloc.onPasswordChanged.add,
    );

    return StreamBuilder<SignInState>(
        stream: bloc.state,
        initialData: SignInState(false),
        builder: (BuildContext context, AsyncSnapshot<SignInState> snapshot) {
          final state = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).signin),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                      top: 58,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).welcome,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: emailInput,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 25),
                            child: passwordInput,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: RaisedButton(
                              child: Text(
                                state.enable
                                    ? "AAA"
                                    : AppLocalizations.of(context).signin,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Colors.blueAccent,
                              onPressed: () {},
                            ),
                          )
                        ],
                      )),
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                            textTheme: ButtonTextTheme.primary,
                            child: Text(
                                AppLocalizations.of(context).reset_password),
                            onPressed: () {
                              _showPicker(context);
                            }),
                        FlatButton(
                          textTheme: ButtonTextTheme.primary,
                          child: Text(AppLocalizations.of(context).contact_us),
                          onPressed: () {
                            // const url = 'mailto://11@boxue.io';
                            _launchURL();
                          },
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            AppLocalizations.of(context).rights_info,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.lightGray3, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _launchURL() async {
    const url = 'mailto:11@boxue.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // throw 'Could not launch $url';
      showError(context, 'Can not open send Email.');
    }
  }

  _showPicker(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime(2019, 1, 1),
        firstDate: DateTime(1990, 1, 1),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year
        );
  }
}
