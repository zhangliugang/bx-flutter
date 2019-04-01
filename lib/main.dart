import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';
import 'package:boxue/i18n/AppLocalizations.dart';
import 'pages/splash_page.dart';
import 'bloc/main_bloc.dart';
import 'bloc/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        const AppLocalizationsDelegate()
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh')
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueAccent[300],
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          // color: Colors.white,
          elevation: 2,
          textTheme: TextTheme(
            title: TextStyle(
              // color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
            )
          ),
          // iconTheme: IconThemeData.fallback()
        )
      ),
      home: BlocProvider(
        bloc: MainBloc(),
        child: SplashPage()
        ),
    );
  }
}

//pub run intl_translation:generate_from_arb --output-dir=lib/i18n lib/AppLocalizations.dart lib/i18n/intl_*.arb
//pub run intl_translation:extract_to_arb --output-dir=lib/i18n lib/AppLocalizations.dart