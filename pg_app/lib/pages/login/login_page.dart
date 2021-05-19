import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pg_app/blocs/authentication_bloc.dart';
import 'package:pg_app/blocs/login_bloc.dart';
import 'package:pg_app/events/authentication_event.dart';
import 'package:pg_app/events/login_event.dart';
import 'package:pg_app/repositoties/user_repository.dart';
import 'package:pg_app/states/login_state.dart';

class LoginPage extends StatefulWidget{
  final UserRepository _userRepository;

  LoginPage({Key key, UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }

}
class _LoginPageState extends State<LoginPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);

  }

  bool get isPopulated =>
      _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      controller: _usernameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "username",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _onLoginEmailAndPassword,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: BlocBuilder<LoginBloc,LoginState>(
          builder: (context,loginState){
            if(loginState.isFailure) {
              print('Login false');
            }else if(loginState.isSubmitting){
              print('Logging in');
            }else if(loginState.isSuccess){
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationEventLoggedIn());
            }
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  color: Colors.white,
                  child:Form(
                    child:  Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 155.0,
                            child: Image.asset(
                              "assets/logo.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 45.0),
                          emailField,
                          SizedBox(height: 25.0),
                          passwordField,
                          SizedBox(
                            height: 35.0,
                          ),
                          loginButon,
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
  void _onLoginEmailAndPassword() {
    _loginBloc.add(LoginEventWithUsernameAndPasswordPressed(
        username: _usernameController.text, password: _passwordController.text));
  }
}