import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pg_app/blocs/login_bloc.dart';
import 'package:pg_app/events/login_event.dart';
import 'package:pg_app/pages/components/rounded_button.dart';
import 'package:pg_app/pages/components/rounded_input.dart';
import 'package:pg_app/pages/components/rounded_password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
    @required this.isLogin,
    @required this.animationDuration,
    @required this.size,
    @required this.defaultLoginSize,
    @required this.emailTextController,
    @required this.passTextController,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;
  final TextEditingController emailTextController;
  final TextEditingController passTextController;

  _onLoginEmailAndPassword(BuildContext context) {
    if (emailTextController.text != null && passTextController.text != null)
      BlocProvider.of<LoginBloc>(context)
        ..add(LoginEventWithUsernameAndPasswordPressed(
            username: emailTextController.text,
            password: passTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 1.0 : 0.0,
      duration: animationDuration * 4,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 40),
                SvgPicture.asset('assets/images/login.svg'),
                SizedBox(height: 40),
                RoundedInput(
                  icon: Icons.mail,
                  hint: 'Username',
                  controller: emailTextController,
                ),
                RoundedPasswordInput(
                  hint: 'Password',
                  controller: passTextController,
                ),
                SizedBox(height: 10),
                RoundedButton(
                  title: 'LOGIN',
                  action: _onLoginEmailAndPassword(context),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
