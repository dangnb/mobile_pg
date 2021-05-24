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
   // ignore: recursive_getters
  final String message;
  CheckInSuccessState({ required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class CheckInErrorState extends CheckInSate{
  final String message;
  CheckInErrorState({ required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class CheckInLoadingState extends CheckInSate {
  @override
  List<Object> get props => [];
}
