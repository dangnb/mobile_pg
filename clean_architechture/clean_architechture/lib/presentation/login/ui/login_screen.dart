import 'package:clean_architechture/config/colors.dart';
import 'package:clean_architechture/presentation/common/dialog/loading_dialog.dart';
import 'package:clean_architechture/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architechture/utils/route/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/cancel_button.dart';
import 'components/login_form.dart';
import 'components/register_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = Duration(milliseconds: 270);


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    animationController = AnimationController(vsync: this, duration: animationDuration);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.clear();
    passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var viewInset = MediaQuery.of(context).viewInsets.bottom; // we are using this to determine Keyboard is opened or not
    var defaultLoginSize = size.height - (size.height * 0.2);
    var defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginSuccessState:
            LoadingDialog.hideLoadingDialog;
            Navigator.pushNamed(context, RouteDefine.HomeScreen.name);
            break;
          case LoginErrorState:
            print("Login error");
            LoadingDialog.hideLoadingDialog;
            break;
          case LoginLoadingState:
            LoadingDialog.showLoadingDialog(context);
            break;
        }
      },
      builder: (context, state) {
        return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              body: Stack(
                children: [
                  // Lets add some decorations
                  Positioned(
                      top: 100,
                      right: -50,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.kPrimaryColor
                        ),
                      )
                  ),

                  Positioned(
                      top: -50,
                      left: -50,
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.kPrimaryColor
                        ),
                      )
                  ),

                  // Cancel Button
                  CancelButton(
                    isLogin: isLogin,
                    animationDuration: animationDuration,
                    size: size,
                    animationController: animationController,
                    tapEvent:  () { // returning null to disable the button
                      animationController.reverse();
                      setState(() {
                        var bool = isLogin = !isLogin;
                      });
                    },
                  ),

                  // Login Form
                  LoginForm(isLogin: isLogin, animationDuration: animationDuration
                    , size: size, defaultLoginSize: defaultLoginSize
                    ,userNameController: userNameController,passwordController: passwordController),

                  // Register Container
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      if (viewInset == 0 && isLogin) {
                        return buildRegisterContainer();
                      } else if (!isLogin) {
                        return buildRegisterContainer();
                      }

                      // Returning empty container to hide the widget
                      return Container();
                    },
                  ),

                  // Register Form
                  RegisterForm(isLogin: isLogin, animationDuration: animationDuration, size: size, defaultLoginSize: defaultRegisterSize
                  ,userNameController: userNameController,passwordController: passwordController,confirmController: confirmController,),
                ],
              ),
            )
        );;
      },
    );
  }
  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
            color: AppColors.kBackgroundColor
        ),

        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin ? null : () {
            animationController.forward();

            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin ? Text(
            "Don't have an account? Sign up",
            style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: 18
            ),
          ) : null,
        ),
      ),
    );
  }
}
