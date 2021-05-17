import 'package:rxdart/rxdart.dart';
class LoginVewModel{
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

//
//  Inputs
//
  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;

//
// Validators
//
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

//
// Outcome of the validation
//
  Stream<bool> get registerValid => Observable.combineLatest2(
      email,
      password,
          (e, p) => true
  );
}