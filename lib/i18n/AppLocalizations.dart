import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {

    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = name;

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  // Welcome screen
  String get app_title => Intl.message('4K Screencasts for App Artisan', name: 'app_title', desc: 'app title');
  String get app_slogan => Intl.message('Modern, priactical app development', name: 'app_slogan', desc: 'app slogan');
  String get rights_info => Intl.message('Copyright © 2015-2018 Boxue. All rights reserved.', name: 'rights_info', desc: ' copy rights');
  String get signin => Intl.message('Sign In', name: 'signin', desc: '');
  String get browse_now => Intl.message('Browse Videos', name: 'browse_now');

  // SignIn screen
  String get welcome => Intl.message('Welcome Back!', name: 'welcome');
  String get email => Intl.message('Email', name: 'email');
  String get password => Intl.message('Password', name: 'password');
  String get contact_us => Intl.message('Contact Us', name: 'contact_us');
  String get reset_password => Intl.message('Reset Password', name: 'reset_password');
  String get signin_error_title => Intl.message('Sign in failed', name: 'signin_error_title');
  String get signin_error_desc => Intl.message("Oops! We couldn't verify your credentials. \nPlease try again.", name: 'signin_error_desc');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }

}