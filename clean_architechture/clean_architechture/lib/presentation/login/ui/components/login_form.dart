import 'package:clean_architechture/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architechture/presentation/login/ui/components/rounded_button.dart';
import 'package:clean_architechture/presentation/login/ui/components/rounded_input.dart';
import 'package:clean_architechture/presentation/login/ui/components/rounded_password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  final userNameController;
  final passwordController ;
  final deviceId;
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.userNameController,
    required this.passwordController,
    required this.deviceId
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

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
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),

                const SizedBox(height: 40),

                SvgPicture.asset('assets/images/login.svg'),

                const SizedBox(height: 40),

                RoundedInput(icon: Icons.mail, hint: 'Username', controller: userNameController,),

                RoundedPasswordInput(hint: 'Password', controller: passwordController,),

                const SizedBox(height: 10),

                 RoundedButton(title: 'LOGIN',action: (){
                   print('login');
                   BlocProvider.of<LoginBloc>(context).add(LoginPressed(
                     userNameController.text,
                     deviceId,
                     passwordController.text,
                     true,
                   ));
                 }),

                const SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }
}