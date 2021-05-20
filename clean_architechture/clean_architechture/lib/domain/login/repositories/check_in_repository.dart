import 'dart:io';
import 'package:clean_architechture/data/checkin/checkin_api.dart';
import 'package:geolocator/geolocator.dart';

class CheckInRepository{
  Future<dynamic > _getCurrentLocation() async{
    return await Geolocator.getLastKnownPosition();
  }
  Future<bool> CheckIn({required List<File> files,required String note}) async{
    dynamic  location = await  _getCurrentLocation();
    if(location==null) return false;
    var resfullApi= CheckInApi();
    var result= await resfullApi.CheckIN(url: "/api/client/v1/checkin/in", note: note, files: files, longitude: location.longitude, latitude: location.latitude);
    return result;
  }
}