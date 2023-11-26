
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/download_state.dart';
import 'package:blocwithgetit/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DownloadController extends Cubit<DownloadState> implements IBlocBase {
  DownloadController() : super(DownloadState());

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
    
      
    