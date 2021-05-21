import 'dart:io';

import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';

abstract class CheckInRepository{
  Future<CheckInResponse> CheckIn({required List<File> files,required String note}) ;
}