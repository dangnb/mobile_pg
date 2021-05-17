import 'package:flutter/cupertino.dart';
import 'package:pg_app/helper/base_bloc/base_bloc.dart';
import 'package:provider/provider.dart';
mixin BlocCreator<T extends StatefulWidget> on State<T>{
  B createBloc<B>(){
    var globalBloc= Provider.of<GlobalBloc>(context, listen: false);
    B bloc= Provider.of<B>(context);
    if (bloc is BaseBloc) {
      bloc.injectBloc(globalBloc);
    }
    return bloc;
  }
  B findBloc<B>() {
    return Provider.of<B>(context);
  }
}