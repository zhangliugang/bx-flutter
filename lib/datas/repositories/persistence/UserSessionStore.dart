import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:boxue/datas/models/UserSession.dart';
import 'package:boxue/datas/models/UserProfile.dart';
import 'package:boxue/datas/models/RemoteUserSession.dart';
import 'package:boxue/datas/repositories/Fake.dart';

abstract class UserSessionStore {
  Future<UserSession> save(UserSession session);
  Future<UserSession> load();
  Future<bool> delete();

  @protected
  static UserSessionStore fake() {
    return FakeUserSessionStore(true);
  }
}

class FakeUserSessionStore extends UserSessionStore {
  FakeUserSessionStore(this.hasToken);

  final bool hasToken;

  @override
  Future<bool> delete() {
    return Future.value(true);
  }

  @override
  Future<UserSession> load() {
    return hasToken ? _withToken() : _withoutToken();
  }

  @override
  Future<UserSession> save(UserSession session) {
    return Future.value(session);
  }

  Future<UserSession> _withToken() {
    return Future((){
      final profile = UserProfile(Fake.name, Fake.email, Fake.password, Fake.avatar);
      final remoteSession = RemoteUserSession(Fake.token);
      return UserSession(profile, remoteSession);
    });
  }

  Future<UserSession> _withoutToken() => Future.error(Error());
}

class FileBasedUserSessionStore extends UserSessionStore {
  Future<File> _sessionFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/user_session.json');
  }

  @override
  Future<bool> delete() {
    return _sessionFile().then((file){
      return file.delete(recursive: true);
    }).then((_){
      return true;
    }).catchError((_){
      return false;
    });
  }

  @override
  Future<UserSession> load() {
    return _sessionFile().then((file){
      return file.readAsString();
    }).then((string){
      return UserSession.fromJson(json.decode(string));
    });
  }

  @override
  Future<UserSession> save(UserSession session) {
     return _sessionFile().then((file) {
       file.writeAsString(json.encode(session.toJson()), mode: FileMode.writeOnly);
     }).whenComplete((){
       return session;
     });
  }

}