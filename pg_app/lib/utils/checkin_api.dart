import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pg_app/common/config_system.dart';
import 'package:pg_app/utils/store_location.dart';

class CheckInApi {
  Future<dynamic> CheckIN(
      {@required String url,
      @required String note,
      @required List<File> files,
      @required double longitude,
      @required double latitude}) async {
    String token ="Bearer "+ await StoreLocation.getToken();
    var headers = {'Authorization': token};
    Uri uri=Uri.parse(Constant.baseUrl + url);
    var request =
        http.MultipartRequest('POST',uri );
    request.fields.addAll({
      'Longitude': longitude.toString(),
      'Note': note,
      'Latitude': latitude.toString()
    });
    files.forEach((element) {
      request.files.add(http.MultipartFile(
        'Images',
        element.readAsBytes().asStream(),
        element.lengthSync(),
      ));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result =await response.stream.bytesToString();
      print(result);
      return result;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
