import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class CheckInRepository{
  Future<Position> _getCurrentLocation() async{
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<bool> CheckIn({@required List<File> files,@required String note}) async{
    Position location = await  _getCurrentLocation();
    if(location==null) return false;
    CheckInApi resfullApi= new CheckInApi();
    var result= await resfullApi.CheckIN(url: "/api/client/v1/checkin/in", note: note, files: files, longitude: location.longitude, latitude: location.latitude);
  }
}