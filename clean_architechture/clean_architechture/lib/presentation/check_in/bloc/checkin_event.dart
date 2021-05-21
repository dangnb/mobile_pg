part of 'checkin_bloc.dart';

abstract class CheckInEvent extends Equatable{
  const CheckInEvent();
}
class CheckInProcess extends CheckInEvent{
  final List<File> files;
  final String note;
  final bool isError;
  CheckInProcess({required this.files, required this.note, required this.isError});

  @override
  // TODO: implement props
  List<Object?> get props => [files,note,isError];
}
