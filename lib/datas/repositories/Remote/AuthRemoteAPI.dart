import 'dart:async';
import 'package:boxue/datas/models/UserSession.dart';
import 'package:boxue/datas/models/NewAccount.dart';
import 'package:boxue/datas/models/UserProfile.dart';
import 'package:boxue/datas/models/RemoteUserSession.dart';
import 'package:boxue/datas/repositories/Fake.dart';

abstract class AuthRemoteAPI {
  Future<UserSession> signIn(String username, String password);
  Future<UserSession> signUp(NewAccount account);
}

class FakeAuthRemoteAPI implements AuthRemoteAPI {
  @override
  Future<UserSession> signIn(String username, String password) {
    return Future(() {
      if (username != Fake.email || password != Fake.password) {
        return Future.error(0);
      }

      var profile = UserProfile(Fake.name, Fake.email, Fake.password, Fake.avatar);
      var remoteSession = RemoteUserSession(Fake.token);
      return UserSession(profile, remoteSession);
    });
  }

  @override
  Future<UserSession> signUp(NewAccount account) {
    return Future((){
      var profile = UserProfile(account.name, account.email, account.mobile, Fake.avatar);
      var remoteSession = RemoteUserSession(Fake.token);
      return UserSession(profile, remoteSession);
    });
  }

}