import 'package:clean_architechture/domain/login/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository _userRepository;

  AuthenticationBloc({required LoginRepository userRepository})
      :
        assert(userRepository != null),
        _userRepository=userRepository,
        super(AuthenticationStateInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent authenticationEvent) async* {
    if (authenticationEvent is AuthenticationEventStared) {
      final isSignedId = await _userRepository.isLogin();
      if (isSignedId) {
        yield const AuthenticationStateSuccess();
      } else {
        yield AuthenticationStateFailure();
      }
    }
    else if (authenticationEvent is AuthenticationEventLoggedIn) {
      yield const AuthenticationStateSuccess();
    }
    else if (authenticationEvent is AuthenticationEventLoggedOut) {
      _userRepository.signOut();
      yield AuthenticationStateFailure();
    }
  }
}
