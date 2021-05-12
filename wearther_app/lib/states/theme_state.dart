import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ThemeState extends Equatable {
  final Color backGroundColor;
  final Color textColor;

  const ThemeState({@required this.backGroundColor, @required this.textColor})
      : assert(textColor != null),
        assert(backGroundColor != null);

  @override
  // TODO: implement props
  List<Object> get props => [textColor, backGroundColor];
}
