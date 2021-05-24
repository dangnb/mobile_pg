import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/domain/checkin/usecase/checkin_usecase.dart';
import 'package:clean_architechture/utils/models/response_api.dart';
import 'package:equatable/equatable.dart';

part 'checkin_event.dart';

part 'checkin_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInSate> {
  final CheckInUseCase checkInUseCase;

  CheckInBloc(this.checkInUseCase) : super(CheckInInitialState());

  @override
  Stream<CheckInSate> mapEventToState(CheckInEvent event) async* {
    if (event is CheckInProcess) {
      yield* _mapCheckInPressToState(event);
    }
  }

  Stream<CheckInSate> _mapCheckInPressToState(CheckInProcess event) async* {
    var message = 'Có lỗi xảy ra';
    try {
      yield CheckInLoadingState();
      if (event.files.isEmpty) {
        message = 'Ban chua chup anh bang chung';
        yield CheckInErrorState(message: message);
        return;
      }
      var response =
          await checkInUseCase.CheckIn(files: event.files, note: event.note);
      if (response.status) {
        var checkInAddress = response.body!.CheckIn_ShopAddress;
        if (checkInAddress != null) {
          yield CheckInSuccessState(message: checkInAddress);
          return;
        }
        yield CheckInErrorState(message: 'Bạn đang check in sai địa điểm');
        return;
      } else {
        message = response.description!;
        yield CheckInErrorState(message: message);
      }
    } catch (error) {
      yield CheckInErrorState(message: 'Có lỗi xảy ra');
      print("Error : $error");
    }
  }
}
