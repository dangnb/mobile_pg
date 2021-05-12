import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wearther_app/events/theme_event.dart';
import 'package:wearther_app/models/weather.dart';
import 'package:wearther_app/states/theme_state.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            backGroundColor: Colors.lightBlue, textColor: Colors.white));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent themeEvent) async* {
    if (themeEvent is ThemeEventWeatherChanged) {
      final weatherCondition = themeEvent.weatherCondition;
      if (weatherCondition == WeatherCondition.clear ||
          weatherCondition == WeatherCondition.lightCloud) {
        yield ThemeState(
            backGroundColor: Colors.yellow, textColor: Colors.black);
      } else if (weatherCondition == WeatherCondition.hail ||
          weatherCondition == WeatherCondition.sleet) {
        yield ThemeState(
            backGroundColor: Colors.lightBlue, textColor: Colors.white);
      } else if (weatherCondition == WeatherCondition.heavyCloud ||
          weatherCondition == WeatherCondition.lightRain ||
          weatherCondition == WeatherCondition.showers) {
        yield ThemeState(
            backGroundColor: Colors.indigo, textColor: Colors.white);
      } else if (weatherCondition == WeatherCondition.thunderstorm) {
        yield ThemeState(
            backGroundColor: Colors.deepPurple, textColor: Colors.white);
      } else {
        yield ThemeState(
            backGroundColor: Colors.lightBlue, textColor: Colors.white);
      }
    }
  }
}
