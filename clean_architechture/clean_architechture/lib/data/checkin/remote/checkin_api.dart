import 'dart:io';
import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'checkin_api.g.dart';

@RestApi()
abstract class CheckInApi {
  factory CheckInApi(Dio dio, {String baseUrl}) = _CheckInApi;

  @POST('/checkin/in')
  Future<CheckInResponse> checkIn(
    @Part(name: 'Images') List<File> file,
    @Part(name: 'Longitude') double longitude,
    @Part(name: 'Latitude') double latitude,
    @Part(name: 'Note') String note,
    @Header("Authorization") String? token
  );
}
