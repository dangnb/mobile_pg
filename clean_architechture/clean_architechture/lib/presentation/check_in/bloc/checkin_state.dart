part of 'checkin_bloc.dart';

abstract class CheckInSate extends Equatable{
  const CheckInSate();
}
class CheckInInitialState extends CheckInSate{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CheckInSuccessState extends CheckInSate{
  final CheckInResponse? checkInResponse;
  CheckInSuccessState({this.checkInResponse});
  @override
  // TODO: implement props
  List<Object?> get props => [checkInResponse];
}
class CheckInErrorState extends CheckInSate{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CheckInLoadingState extends CheckInSate {
  @override
  List<Object> get props => [];
}
