import 'dart:convert';
import 'dart:io';
import 'package:clean_architechture/utils/session_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CheckInApi {
  Future<dynamic> CheckIN(
      {required String url,
      required String note,
      required List<File> files,
      required double longitude,
      required double latitude}) async {
    var token = "Bearer " +  SessionUtils.getAccessToken()!;
    var headers = {'Authorization': token};
    var uri = Uri.parse("" + url);
    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll({
      'Longitude': longitude.toString(),
      'Note': note,
      'Latitude': latitude.toString()
    });
    files.forEach((file) async {
      request.files.add(await http.MultipartFile.fromPath('Images', file.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      print(result);
      return result;
    } else {
      var result = await response.stream.bytesToString();
      print(response.reasonPhrase);
      return null;
    }
  }
}
