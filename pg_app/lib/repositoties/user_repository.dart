import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pg_app/common/config_system.dart';
import 'package:pg_app/utils/session.dart';
import 'package:pg_app/utils/store_location.dart';



class UserRepository {
  final http.Client httpClient;
  UserRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<bool> login (
  {@required String username, @required String password}) async {
    var response= await Session.Login(url: '/api/client/v1/account/login', comId: "9",userName:  username,passWord: password);
    var result= jsonDecode(response);
    if(result!=null){
      await StoreLocation.setToken(result['token'] as String);
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
