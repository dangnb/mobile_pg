import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/events/authentication_event.dart';
import 'package:product_app/repositoties/user_repository.dart';
import 'package:product_app/states/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
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
        yield AuthenticationStateSuccess();
      } else {
        yield AuthenticationStateFailure();
      }
    }
    else if (authenticationEvent is AuthenticationEventLoggedIn) {
      yield AuthenticationStateSuccess();
    }
    else if (authenticationEvent is AuthenticationEventLoggedOut) {
      _userRepository.signOut();
      yield AuthenticationStateFailure();
    }
  }
}