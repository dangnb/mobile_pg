part of 'checkout_bloc.dart';


abstract class CheckOutEvent extends Equatable{
  CheckOutEvent();
}
class CheckOutProcess extends CheckOutEvent{
  final List<File> files;
  final String note;
  final bool isError;
  CheckOutProcess({required this.files, required this.note, required this.isError});

  @override
  // TODO: implement props
  List<Object?> get props => [files,note,isError];
}
