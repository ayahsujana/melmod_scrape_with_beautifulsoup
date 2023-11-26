import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/detail_state.dart';
import 'package:blocwithgetit/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class DetailController extends Cubit<DetailState> implements IBlocBase {
  DetailController() : super(DetailState());

  @override
  void initState() {
    //initState event
    ApplovinAdNetwork().onInit();
    
  }

  @override
  void dispose() {
    //dispose event
    ApplovinAdNetwork().dispose();
  }

  @override
  void ready() {
    //ready event
  }

  getMelmodDetail({required String url}) async {
    state.isLoading;

    final parser = DetailParser(url);
    parser.serviceHTML().then((body) {
      final soup = BeautifulSoup(body);
      final data = parser.parseHTML(soup);

      state.detail = data;
      state.isLoading = false;
      emit(state.copyWith());
    });
  }
}
