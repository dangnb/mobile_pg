import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/pages/home_page.dart';
import 'package:product_app/pages/login/login_page.dart';
import 'package:product_app/pages/splash_page.dart';
import 'package:product_app/repositoties/user_repository.dart';
import 'package:product_app/states/authentication_state.dart';

import 'blocs/authentication_bloc.dart';
import 'blocs/login_bloc.dart';
import 'blocs/simple_bloc_observer.dart';
import 'events/authentication_event.dart';
import 'package:http/http.dart' as http;

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository(httpClient: http.Client());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with Firebase',
      home: Scaffold(
          body: BlocProvider(
              create: (context) =>
                  AuthenticationBloc(userRepository: _userRepository)
                    ..add(AuthenticationEventStared()),
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, authenticationState) {
                if (authenticationState is AuthenticationStateSuccess) {
                  return HomePage();
                } else if (authenticationState is AuthenticationStateFailure) {
                  return BlocProvider<LoginBloc>(
                    create: (context) =>
                        LoginBloc(userRepository: _userRepository),
                    child: LoginPage(userRepository: _userRepository),
                  );
                }
                return SplashPage();
              }))),
    );
  }
}
