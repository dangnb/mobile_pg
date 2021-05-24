part of 'checkout_bloc.dart';

abstract class CheckOutState extends Equatable{
  CheckOutState();
}
class CheckOutInitialState extends CheckOutState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CheckOutSuccessState extends CheckOutState{
  // ignore: recursive_getters
  final String message;
  CheckOutSuccessState({ required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class CheckOutErrorState extends CheckOutState{
  final String message;
  CheckOutErrorState({ required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class CheckOutLoadingState extends CheckOutState {
  @override
  List<Object> get props => [];
}
