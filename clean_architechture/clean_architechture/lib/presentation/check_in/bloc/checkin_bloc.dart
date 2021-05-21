
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_architechture/data/checkin/models/response/checkin_response.dart';
import 'package:clean_architechture/domain/checkin/usecase/checkin_usecase.dart';
import 'package:equatable/equatable.dart';
part 'checkin_event.dart';
part 'checkin_state.dart';
class CheckInBloc extends Bloc<CheckInEvent, CheckInSate> {
   final CheckInUseCase checkInUseCase;
   CheckInBloc(this.checkInUseCase):super(CheckInInitialState());
@override
  Stream<CheckInSate> mapEventToState(CheckInEvent event) async*{
  if (event is CheckInProcess) {
    yield* _mapCheckInPressToState(event);
  }
  }

   Stream<CheckInSate> _mapCheckInPressToState(CheckInProcess event) async* {
    try{
      yield CheckInLoadingState();
      var reponse= await checkInUseCase.CheckIn(files: event.files, note: event.note);
      print(reponse.toString());
      yield CheckInSuccessState(checkInResponse: reponse);
    }catch (error) {
      yield CheckInErrorState();
      print("Error : $error");
    }
   }
}