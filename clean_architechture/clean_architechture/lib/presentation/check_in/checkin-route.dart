import 'package:clean_architechture/domain/checkin/respositories/check_in_repository.dart';
import 'package:clean_architechture/domain/checkin/usecase/checkin_usecase.dart';
import 'package:clean_architechture/presentation/check_in/bloc/checkin_bloc.dart';
import 'package:clean_architechture/presentation/check_in/ui/check_in.dart';
import 'package:clean_architechture/utils/di/injection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckInRoute {
  static Widget get route => BlocProvider(
    create: (context) => CheckInBloc(
      CheckInUseCase(
        getIt<CheckInRepository>(),
      ),
    ),
    child: CheckInScreen(),
  );
}
