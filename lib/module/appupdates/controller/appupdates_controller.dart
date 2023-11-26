
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/appupdates_state.dart';
import 'package:blocwithgetit/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppupdatesController extends Cubit<AppupdatesState> implements IBlocBase {
  AppupdatesController() : super(AppupdatesState());

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  increment() {
    state.counter++;
    emit(state.copyWith());
  }
}
    
      
    