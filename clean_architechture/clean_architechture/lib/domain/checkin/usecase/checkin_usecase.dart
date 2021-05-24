import 'dart:io';

import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/domain/checkin/respositories/check_in_repository.dart';
import 'package:clean_architechture/utils/models/response_api.dart';

class CheckInUseCase {
  final CheckInRepository _repository;
  CheckInUseCase(this._repository);
  Future<ResponseApi<CheckInResponse>> CheckIn({required List<File> files, required String note})=> _repository.CheckIn(files: files, note: note);
  Future<ResponseApi<CheckInResponse>> CheckOut({required List<File> files, required String note})=> _repository.CheckOut(files: files, note: note);
}