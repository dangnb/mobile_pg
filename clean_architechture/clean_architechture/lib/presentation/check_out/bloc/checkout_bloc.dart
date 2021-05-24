
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_architechture/domain/checkin/usecase/checkin_usecase.dart';
import 'package:equatable/equatable.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';
class CheckOutBloc extends Bloc<CheckOutEvent,CheckOutState>{
  final CheckInUseCase checkInUseCase;
  CheckOutBloc(this.checkInUseCase):super(CheckOutInitialState());
  @override
  Stream<CheckOutState> mapEventToState(CheckOutEvent event) async*{
    if (event is CheckOutProcess) {
      yield* _mapCheckOutPressToState(event);
    }
  }
  Stream<CheckOutState> _mapCheckOutPressToState(CheckOutProcess event) async* {
    var message = 'Có lỗi xảy ra';
    try {
      yield CheckOutLoadingState();
      if (event.files.isEmpty) {
        message = 'Ban chua chup anh bang chung';
        yield CheckOutErrorState(message: message);
        return;
      }
      var response =
      await checkInUseCase.CheckOut(files: event.files, note: event.note);
      if (response.status) {
        var checkInAddress = response.body!.CheckIn_ShopAddress;
        if (checkInAddress != null) {
          yield CheckOutSuccessState(message: checkInAddress);
          return;
        }
        yield CheckOutErrorState(message: 'Bạn đang check out sai địa điểm');
        return;
      } else {
        message = response.description!;
        yield CheckOutErrorState(message: message);
      }
    } catch (error) {
      yield CheckOutErrorState(message: 'Có lỗi xảy ra');
      print("Error : $error");
    }
  }
}