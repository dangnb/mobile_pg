import 'package:json_annotation/json_annotation.dart';

part 'checkin_response.g.dart';

@JsonSerializable()
class CheckInResponse {
  final int Id;
  final String EmployeeCode;
  final String CheckDate;
  final String Checkin;
  final String CheckIn_Longitude;
  final String CheckIn_Latitude;
  final String CheckIn_Images;
  final String CheckIn_Note;
  final String CheckIn_ShopId;
  final String CheckIn_ShopAddress;
  final String CheckOut;
  final String CheckOut_Longitude;
  final String CheckOut_Latitude;
  final String CheckOut_Images;
  final String CheckOut_Note;
  final String CheckOut_ShopId;
  final String CheckOut_ShopAddress;
  CheckInResponse({required this.Id
    ,required this.EmployeeCode
    , required this.Checkin,
    required this.CheckIn_Longitude,
    required this.CheckIn_Latitude,
    required this.CheckIn_Images,
    required this.CheckIn_Note,
    required this.CheckIn_ShopId,
    required this.CheckIn_ShopAddress,
    required this.CheckOut,
    required this.CheckOut_Longitude,
    required this.CheckOut_Latitude,
    required this.CheckOut_Images,
    required this.CheckOut_Note,
    required this.CheckOut_ShopId,
    required this.CheckOut_ShopAddress,
    required this.CheckDate,
  });
  factory CheckInResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInResponseToJson(this);

}