import 'package:clean_architechture/domain/checkin/respositories/check_in_repository.dart';
import 'package:clean_architechture/domain/checkin/usecase/checkin_usecase.dart';
import 'package:clean_architechture/presentation/check_out/ui/check_out.dart';
import 'package:clean_architechture/utils/di/injection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/checkout_bloc.dart';

class CheckOutRoute {
  static Widget get route => BlocProvider(
    create: (context) => CheckOutBloc(
      CheckInUseCase(
        getIt<CheckInRepository>(),
      ),
    ),
    child: CheckOutScreen(),
  );
}
