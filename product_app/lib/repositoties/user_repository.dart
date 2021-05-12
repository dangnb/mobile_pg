import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:product_app/common/config_system.dart';
import 'package:product_app/utils/api_base.dart';
import 'package:product_app/utils/store_location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:product_app/utils/session.dart';



class UserRepository {
  final http.Client httpClient;
  UserRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<bool> login (
  {@required String username, @required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data={
      'userName': username,
      'passWord': password,
      'rememberMe': true
    };
    var response= await Session.apiPost('/api/Users/authenticate', data);
    var result=jsonDecode(response);
    if(result['isSuccessed'] as bool){
      StoreLocation.setToken(result['resultObj'] as String);
      var con= await ApiBase.apiGet('/api/categories?languageId=vi');
      print(jsonDecode(con));
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
