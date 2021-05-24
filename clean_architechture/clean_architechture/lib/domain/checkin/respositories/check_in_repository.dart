import 'dart:io';
import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/utils/models/response_api.dart';

abstract class CheckInRepository{
  Future<ResponseApi<CheckInResponse>> CheckIn({required List<File> files,required String note}) ;
  Future<ResponseApi<CheckInResponse>> CheckOut({required List<File> files,required String note}) ;
}