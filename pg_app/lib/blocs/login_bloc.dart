import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pg_app/events/login_event.dart';
import 'package:pg_app/repositoties/user_repository.dart';
import 'package:pg_app/states/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository=userRepository,
        super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async* {
    // TODO: implement mapEventToState
    if (loginEvent is LoginEventWithUsernameAndPasswordPressed) {
      try {
        final bool isLoginSuccess = await _userRepository.login(
            username: loginEvent.username.trim(),
            password: loginEvent.password.trim());
        if (isLoginSuccess) {
          yield LoginState.success();
          return;
        }
        yield LoginState.failure();
      } catch (_) {
        yield LoginState.failure();
      }
    }
  }
}
