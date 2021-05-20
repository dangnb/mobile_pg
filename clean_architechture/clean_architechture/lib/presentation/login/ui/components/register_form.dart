import 'package:clean_architechture/presentation/login/ui/components/rounded_button.dart';
import 'package:clean_architechture/presentation/login/ui/components/rounded_input.dart';
import 'package:clean_architechture/presentation/login/ui/components/rounded_password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
    required this.userNameController,
    this.passwordController,
    this.confirmController
  }) : super(key: key);
  final userNameController;
  final passwordController ;
  final confirmController ;
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration * 5,
      child: Visibility(
        visible: !isLogin,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            height: defaultLoginSize,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const SizedBox(height: 10),

                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),

                  const SizedBox(height: 40),

                  SvgPicture.asset('assets/images/register.svg'),

                  const SizedBox(height: 40),

                   RoundedInput(icon: Icons.mail, hint: 'Username',controller: userNameController,),

                  RoundedInput(icon: Icons.face_rounded, hint: 'Name',controller: passwordController,),

                  RoundedPasswordInput(hint: 'Password',controller: confirmController,),

                  const SizedBox(height: 10),

                  RoundedButton(title: 'SIGN UP',action: (){},),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}