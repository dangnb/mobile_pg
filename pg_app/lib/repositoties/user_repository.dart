import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pg_app/utils/api_base.dart';
import 'package:pg_app/utils/api_base_cer.dart';
import 'package:pg_app/utils/session.dart';
import 'package:pg_app/utils/store_location.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserRepository {
  final http.Client httpClient;
  UserRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<bool> login (
  {@required String username, @required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data={
      'Username': username,
      'Password': password,
      'ComId': 9
    };
    var response= await Session.apiPost('/api/client/v1/account/login', data);
    var result=jsonDecode(response);
    if(result['isSuccessed'] as bool){
      StoreLocation.setToken(result['resultObj'] as String);
      return true;
    }
    return false;
  }

  Future<bool> isLogin() async {
    var token= await StoreLocation.getToken();
    if(token!=null){
      return true;
    }
    return false;
  }
  void signOut() async{
   await StoreLocation.removeToken();
  }
}
