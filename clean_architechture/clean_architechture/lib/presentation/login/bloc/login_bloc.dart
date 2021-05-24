import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architechture/data/login/models/request/login_request.dart';
import 'package:clean_architechture/domain/login/usecases/login_usecase.dart';
import 'package:clean_architechture/utils/session_utils.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginPressed) {
      yield* _mapLoginPressToState(event);
    }
  }

  Stream<LoginState> _mapLoginPressToState(LoginPressed event) async* {
    try {
      yield LoginLoadingState();
      var response = await loginUseCase.login(
          LoginRequest(
            comId: 9,
            userName: event.userName,
            password: event.password,
          ),
          event.deviceId);
      SessionUtils.saveAccessToken(response.token);
      event =
          LoginPressed(event.userName, event.password, event.deviceId, true);
      if (!event.isError) {
        yield LoginErrorState();
      } else {
        yield LoginSuccessState();
      }
    } catch (error) {
      print("Error : $error");
    }
  }
}
