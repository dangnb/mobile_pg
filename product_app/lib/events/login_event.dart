import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
@override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginEventWithUsernameAndPasswordPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginEventWithUsernameAndPasswordPressed({this.username, this.password});

  @override
  // TODO: implement props
  List<Object> get props => [username, password];

  @override
  String toString() {
    // TODO: implement toString
    return 'LoginEventWithEmailAndPasswordPressed, email: ${this.username}, password: ${this.password}';
  }
}
