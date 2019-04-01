import '../models/NewAccount.dart';
import '../models/UserSession.dart';
import 'remote/AuthRemoteAPI.dart';
import 'persistence/UserSessionStore.dart';

import 'UserSessionRepository.dart';

class BoxueUserSessionRepository extends UserSessionRepository {

  BoxueUserSessionRepository(this.userSessionStore, this.authRemoteAPI);

  final UserSessionStore userSessionStore;
  final AuthRemoteAPI authRemoteAPI;

  @override
  Future<bool> isSignedIn() {
    return userSessionStore.load()
      .then((_) => Future.value(true))
      .catchError((_) => Future.value(false));
  }

  @override
  Future<UserSession> readUserSession() {
    return userSessionStore.load();
  }

  @override
  Future<UserSession> signIn(String email, String password) {
    return authRemoteAPI.signIn(email, password)
      .then(userSessionStore.save);
  }

  @override
  Future<bool> signOut() {
    return userSessionStore.delete();
  }

  @override
  Future<UserSession> signUp(NewAccount newAccount) {
    return authRemoteAPI.signUp(newAccount)
      .then(userSessionStore.save);
  }

}