import 'dart:async';
import 'package:boxue/datas/models/UserSession.dart';
import 'package:boxue/datas/models/NewAccount.dart';

abstract class UserSessionRepository {
  Future<UserSession> readUserSession();
  Future<UserSession> signUp(NewAccount newAccount);
  Future<UserSession> signIn(String email, String password);
  Future<bool> signOut();

  // TODO:  Guarantee<Bool>?
  Future<bool> isSignedIn();
}