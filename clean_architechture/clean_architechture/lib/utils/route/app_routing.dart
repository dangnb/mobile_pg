import 'package:clean_architechture/presentation/check_in/checkin-route.dart';
import 'package:clean_architechture/presentation/check_out/checkout_route.dart';
import 'package:clean_architechture/presentation/check_out/ui/check_out.dart';
import 'package:clean_architechture/presentation/home/home_route.dart';
import 'package:clean_architechture/presentation/list_user/list_user_route.dart';
import 'package:clean_architechture/presentation/login/login_route.dart';
import 'package:flutter/material.dart';

enum RouteDefine {
  LoginScreen,
  HomeScreen,
  CheckInScreen,
  CheckOutScreen
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.LoginScreen.name: (_) => LoginRoute.route,
      RouteDefine.HomeScreen.name: (_) => HomeRoute.route,
      RouteDefine.CheckInScreen.name: (_) => CheckInRoute.route,
      RouteDefine.CheckOutScreen.name: (_) => CheckOutRoute.route,
    };

    final routeBuilder = routes[settings.name];

    return _NoAnimationMaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(_, __, ___, Widget child) => child;
}

extension RouteExt on Object {
  /// Use this to get the enum value converted to string.
  ///
  /// Eg.
  /// ```dart
  /// print(SomeEnum.someValue.name) // someValue
  /// ```
  ///
  String get name => toString().substring(toString().indexOf('.') + 1);
}
