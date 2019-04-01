import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';
import 'package:boxue/datas/repositories/UserSessionRepository.dart';
import 'package:boxue/datas/repositories/BoxueUserSessionRepository.dart';
import 'package:boxue/datas/repositories/remote/AuthRemoteAPI.dart';
import 'package:boxue/datas/repositories/persistence/UserSessionStore.dart';

class MainBloc extends BaseBloc {
  final signIned = PublishSubject<bool>();

  UserSessionStore userSessionStore; // = FileBasedUserSessionStore();
  AuthRemoteAPI authRemoteApi; // = FakeAuthRemoteAPI();
  UserSessionRepository
      uesrSessionRepository; // = BoxueUserSessionRepository(userSessionStore, authRemoteApi);

  MainBloc() {
    userSessionStore = FakeUserSessionStore(false);
    authRemoteApi = FakeAuthRemoteAPI();
    uesrSessionRepository =
        BoxueUserSessionRepository(userSessionStore, authRemoteApi);
  }

  void checkUserSession() {
    Observable.fromFuture(uesrSessionRepository.isSignedIn())
      .debounce(Duration(milliseconds: 500))
      .listen((value) {
        signIned.add(value);
    });
  }

  @override
  void dispose() {
    signIned.close();
  }
}
