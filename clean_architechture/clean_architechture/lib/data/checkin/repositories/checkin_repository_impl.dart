import 'dart:convert';
import 'dart:io';

import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/data/checkin/remote/checkin_api.dart';
import 'package:clean_architechture/domain/checkin/respositories/check_in_repository.dart';
import 'package:clean_architechture/utils/models/response_api.dart';
import 'package:clean_architechture/utils/session_utils.dart';
import 'package:dio/dio.dart';
import 'package:location/location.dart';

class CheckInRepositoryImpl implements CheckInRepository {
  CheckInApi checkInApi;

  CheckInRepositoryImpl(this.checkInApi);

  Future<dynamic> _getCurrentLocation() async {
    var location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    return await location.getLocation();
  }

  @override
  Future<ResponseApi<CheckInResponse>> CheckIn(
      {required List<File> files, required String note}) async {
    try {
      var message = "Co loi xay ra";
      // TODO: implement CheckIn
      var location = await _getCurrentLocation();
      var token = "Bearer " + SessionUtils.getAccessToken()!;
      await checkInApi
      // ignore: deprecated_member_use_from_same_package
          .checkIn(files, location.longitude, location.latitude, note, token)
          .then((value) {
        return ResponseApi(status: true, description: "", body: null);
      }, onError: (Object obj) {
        switch (obj.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (obj as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            var json = jsonDecode(res.toString());
            message = json['Message'] as String;
            break;
          default:
        }
        return ResponseApi(status: false, description: message, body: null);
      });
      return ResponseApi(status: false, description: message, body: null);
    } catch (ex) {
      print(ex);
      return ResponseApi(
          status: false, description: 'Có lỗi xảy ra', body: null);
    }
  }

  @override
  Future<ResponseApi<CheckInResponse>> CheckOut({required List<File> files, required String note}) async {
    try {
      var message = "Co loi xay ra";
      // TODO: implement CheckIn
      var location = await _getCurrentLocation();
      var token = "Bearer " + SessionUtils.getAccessToken()!;
      await checkInApi
          // ignore: deprecated_member_use_from_same_package
          .checkOut(files, location.longitude, location.latitude, note, token)
          .then((value) {
        return ResponseApi(status: true, description: "", body: null);
      }, onError: (Object obj) {
        switch (obj.runtimeType) {
          case DioError:
          // Here's the sample to get the failed response error code and message
            final res = (obj as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            var json = jsonDecode(res.toString());
            message = json['Message'] as String;
            break;
          default:
        }
        return ResponseApi(status: false, description: message, body: null);
      });
      return ResponseApi(status: false, description: message, body: null);
    } catch (ex) {
      print(ex);
      return ResponseApi(
          status: false, description: 'Có lỗi xảy ra', body: null);
    }
  }
}
