import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pg_app/common/config_system.dart';
class ApiBase{
  static Future<dynamic> apiPost(String url, dynamic data)  async{
    var headers = {
      'Notify-Id': 'test notify id',
      'Device-Id': '157a46fe1c03c03d',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request =  http.Request('POST', Uri.parse('http://42.112.21.231:8003/api/client/v1/account/login'));
    request.bodyFields = {
      'ComId': '9',
      'Username': 'dangnb',
      'Password': '1234567',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}