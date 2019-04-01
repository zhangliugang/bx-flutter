import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'bloc_provider.dart';

class SignInState {
  final bool enable;

  SignInState(this.enable);
}

class SignInBloc extends BaseBloc{
  final Sink<String> onEmailChanged;
  final Sink<String> onPasswordChanged;

  final Stream<SignInState> state;

  SignInBloc._(this.onEmailChanged, this.onPasswordChanged, this.state);

  factory SignInBloc() {
    final onEmailChanged = PublishSubject<String>();
    final onPasswordChanged = PublishSubject<String>();

    onEmailChanged.listen((s) {
      print(s);
    });

    final state = Observable.combineLatest2<String, String, bool>(onEmailChanged, onPasswordChanged, (a, b)  {
      return a.length > 0 && b.length > 0;
    }).map<SignInState>((b) => SignInState(b))
      ;


    return SignInBloc._(onEmailChanged, onPasswordChanged, state);
  }

  @override
  void dispose() {
    onEmailChanged.close();
    onPasswordChanged.close();
  }
}

