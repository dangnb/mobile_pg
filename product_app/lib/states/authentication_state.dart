import 'package:equatable/equatable.dart';
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AuthenticationStateInitial extends AuthenticationState {}

class AuthenticationStateSuccess extends AuthenticationState {

  const AuthenticationStateSuccess();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AuthenticationStateFailure extends AuthenticationState {}