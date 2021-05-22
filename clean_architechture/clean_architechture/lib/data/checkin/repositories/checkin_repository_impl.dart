import 'dart:io';

import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/data/checkin/remote/checkin_api.dart';
import 'package:clean_architechture/domain/checkin/respositories/check_in_repository.dart';
import 'package:clean_architechture/utils/session_utils.dart';
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
  Future<CheckInResponse> CheckIn(
      {required List<File> files, required String note}) async {
    try {
      // TODO: implement CheckIn
      var location = await _getCurrentLocation();
      var token = "Bearer " + SessionUtils.getAccessToken()!;
      return await checkInApi
          .checkIn(files, location.longitude, location.latitude, note, token)
          .then((value) {
        print(value);
        return value;
      }, onError: (e) {
        print(e);
        return CheckInResponse(
            Id: 1,
            EmployeeCode: "EmployeeCode",
            Checkin: "Checkin",
            CheckIn_Longitude: 1.0000,
            CheckIn_Latitude: .00,
            CheckIn_Images: ["a", "a"],
            CheckIn_Note: 'CheckIn_Note',
            CheckIn_ShopId: 2,
            CheckIn_ShopAddress: "CheckIn_ShopAddress",
            CheckOut: 'CheckOut',
            CheckOut_Longitude: 1.000,
            CheckOut_Latitude: 1.00,
            CheckOut_Images: ["a", "a"],
            CheckOut_Note: "CheckOut_Note",
            CheckOut_ShopId: 2,
            CheckOut_ShopAddress: "CheckOut_ShopAddress",
            CheckDate: "CheckDate");
      });
    } catch (ex) {
      print(ex);
      return CheckInResponse(
          Id: 1,
          EmployeeCode: "EmployeeCode",
          Checkin: "Checkin",
          CheckIn_Longitude: 1.0000,
          CheckIn_Latitude: .00,
          CheckIn_Images: ["a", "a"],
          CheckIn_Note: 'CheckIn_Note',
          CheckIn_ShopId: 2,
          CheckIn_ShopAddress: "CheckIn_ShopAddress",
          CheckOut: 'CheckOut',
          CheckOut_Longitude: 1.000,
          CheckOut_Latitude: 1.00,
          CheckOut_Images: ["a", "a"],
          CheckOut_Note: "CheckOut_Note",
          CheckOut_ShopId: 2,
          CheckOut_ShopAddress: "CheckOut_ShopAddress",
          CheckDate: "CheckDate");
    }
  }
}
