import 'dart:io';

import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/domain/checkin/respositories/check_in_repository.dart';

class CheckInUseCase {
  final CheckInRepository _repository;
  CheckInUseCase(this._repository);
  Future<CheckInResponse> CheckIn({required List<File> files, required String note})=> _repository.CheckIn(files: files, note: note);
}