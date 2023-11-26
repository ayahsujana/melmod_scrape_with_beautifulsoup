import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/service/melmod_parser.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../state/home_state.dart';
import 'package:blocwithgetit/bloc_util.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeController extends Cubit<HomeState> implements IBlocBase {
  HomeController() : super(HomeState());
  late TextEditingController textController;
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    latestMelmod(refresh: false);
    textController = TextEditingController();
    ApplovinAdNetwork().onInit();
  }

  @override
  void dispose() {
    //dispose event
    textController.dispose();
    refreshController.dispose();
    ApplovinAdNetwork().dispose();
  }

  @override
  void ready() {
    //ready event
  }

  latestMelmod({bool refresh = false}) async {
    state.isNext = refresh;
    state.isLoading;
    if (state.isNext) state.page;

    final parser = MelmodParser('https://melmod.com/mods/page/${state.page}/');

    parser.serviceHTML().then((body) {
      final soup = BeautifulSoup(body);
      final data = parser.parseHTML(soup);

      if (state.isNext)
        state.melmod = data;
      else
        state.melmod += data;

      state.isNext = data.isNotEmpty;

      state.isLoading = false;
      emit(state.copyWith());
    });
  }

  loadMoreMelmod({required bool refresh}) {
    if (refresh) {
      state.page += 1;
      latestMelmod();
    }
  }
}
