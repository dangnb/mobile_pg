import 'dart:async';

import 'package:pg_app/helper/validatioon/validation.dart';
import 'package:rxdart/rxdart.dart';
class LoginVewModel{
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  final BehaviorSubject<bool> _btnController = BehaviorSubject<bool>();
var emailValidation= StreamTransformer<String,String>.fromHandlers(
  handleData: (email,sink){
    sink.add(email);
  }
);
  var passValidation= StreamTransformer<String,String>.fromHandlers(
      handleData: (pass,sink){
        sink.add(pass);
      }
  );
//
//  Inputs
//
  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;

//
// Validators
//
  Stream<String> get emailStream => _emailController.stream.transform(emailValidation);
  Sink<String> get  emaiSink => _emailController.sink;
  Stream<String> get passStream => _passwordController.stream.transform(passValidation);
  Sink<String> get passSink => _passwordController.sink;
  Stream<bool> get btnStream => _btnController.stream;
  Sink<bool> get btnSink => _btnController.sink;

//
// Outcome of the validation
//

  dispose(){
    _emailController.close();
    _passwordController.close();
    _btnController.close();
  }
  LoginVewModel(){
    Rx.combineLatest2(_emailController, _passwordController, (a, b){
      return Validation.validateEmail(a)==null&&Validation.validatePass(b)==null;
    }).listen((event) {btnSink.add(event);});
  }
}