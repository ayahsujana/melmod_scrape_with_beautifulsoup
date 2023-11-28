import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SearchModController extends Cubit<SearchModState> implements IBlocBase {
  SearchModController() : super(SearchModState());

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

  getMelmodSearch({bool refresh = false, required String query}) async {
    state.isNext = refresh;
    state.isLoading;
    if (state.isNext) state.page;

    final parser =
        MelmodParser('https://melmod.com/page/${state.page}/?s=$query');
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

  loadMoreSearch({required bool refresh, required query}) {
    if (refresh) {
      state.page += 1;
      getMelmodSearch(query: query);
    }
  }
}
