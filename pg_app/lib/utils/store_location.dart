import 'dart:async';
import 'package:pg_app/common/config_system.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreLocation{
  static Future<void> setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constant.TOKEN,token);
  }
  static Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constant.TOKEN);
  }
  static Future<void> removeToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(Constant.TOKEN);
  }
}