import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pg_app/pages/login/login_page.dart';
import 'package:pg_app/pages/splash_page.dart';
import 'package:pg_app/repositoties/user_repository.dart';
import 'package:pg_app/states/authentication_state.dart';
import 'blocs/authentication_bloc.dart';
import 'blocs/login_bloc.dart';
import 'blocs/simple_bloc_observer.dart';
import 'constants.dart';
import 'events/authentication_event.dart';
import 'main_page.dart';
import 'package:http/http.dart' as http;

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final UserRepository _userRepository = UserRepository(httpClient: http.Client());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
      ),
      home:Scaffold(
        body: BlocProvider(
            create: (context) =>
            AuthenticationBloc(userRepository: _userRepository)
              ..add(AuthenticationEventStared()),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, authenticationState) {
                  if (authenticationState is AuthenticationStateSuccess) {
                    return MainPage();
                  } else if (authenticationState is AuthenticationStateFailure) {
                    return BlocProvider<LoginBloc>(
                      create: (context) =>
                          LoginBloc(userRepository: _userRepository),
                      child: LoginPage(userRepository: _userRepository),
                    );
                  }
                  return SplashPage();
                })),
      ),
    );
  }
}