import 'package:flutter/cupertino.dart';

class LoginState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState(
      {@required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure});

  factory LoginState.initial() {
    return LoginState(isSubmitting: false, isFailure: false, isSuccess: false);
  }

  factory LoginState.loading() {
    return LoginState(isSubmitting: true, isFailure: false, isSuccess: false);
  }

  factory LoginState.failure() {
    return LoginState(isSubmitting: false, isFailure: true, isSuccess: false);
  }

  factory LoginState.success() {
    return LoginState(isSubmitting: false, isSuccess: true, isFailure: false);
  }

  LoginState cloneWith({
    bool isFailure,
    bool isSubmitting,
    bool isSuccess,
  }) {
    return LoginState(
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure,
        isSuccess: isSuccess ?? this.isSuccess);
  }

  LoginState cloneEndUpdate({bool isValidEmail, bool isValidPassword}) {
    return cloneWith(isSubmitting: false, isFailure: false, isSuccess: false);
  }
}
