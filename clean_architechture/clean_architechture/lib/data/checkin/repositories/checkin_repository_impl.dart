import 'dart:io';

import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/data/checkin/remote/checkin_api.dart';
import 'package:clean_architechture/domain/login/repositories/check_in_repository.dart';
import 'package:clean_architechture/utils/session_utils.dart';
import 'package:geolocator/geolocator.dart';


class CheckInRepositoryImpl implements CheckInRepository{
  CheckInApi checkInApi;
  CheckInRepositoryImpl(this.checkInApi);
  Future<dynamic > _getCurrentLocation() async{
    return await Geolocator.getLastKnownPosition();
  }

  @override
  Future<CheckInResponse> CheckIn({required List<File> files, required String note}) async{
    // TODO: implement CheckIn
    var location = await _getCurrentLocation();
    var token= SessionUtils.getAccessToken();
    var result=await checkInApi.checkIn(files, location.longitude, location.latitude, note, token)
    return result;
  }

}