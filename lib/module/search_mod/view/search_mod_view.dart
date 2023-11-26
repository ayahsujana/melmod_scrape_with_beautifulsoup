// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:blocwithgetit/Util/screen_system.dart';
import 'package:blocwithgetit/module/detail/view/detail_view.dart';
import 'package:blocwithgetit/state_util.dart';
import 'package:blocwithgetit/widget/loading_switcher.dart';
import 'package:blocwithgetit/widget/melmod_contains.dart';

import '../controller/search_mod_controller.dart';
import '../state/search_mod_state.dart';

class SearchModView extends StatefulWidget {
  const SearchModView({
    Key? key,
    required this.query,
  }) : super(key: key);
  final String query;

  @override
  State<SearchModView> createState() => _SearchModViewState();
}

class _SearchModViewState extends State<SearchModView> {
  SearchModController controller = SearchModController();
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<SearchModController>()) {
      GetIt.I.unregister<SearchModController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    controller.getMelmodSearch(refresh: false, query: widget.query);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<SearchModController, SearchModState>(
        listener: (context, state) {},
        child: BlocBuilder<SearchModController, SearchModState>(
          builder: (context, state) {
            final bloc = context.read<SearchModController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    SearchModController controller,
    SearchModState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.cousine(),
        ),
      ),
      body: state.isLoading
          ? loading()
          : LoadingSwitcher(
              loading: state.isLoading,
              child: SmartRefresher(
                controller: refreshController,
                enablePullDown: false,
                enablePullUp: true,
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = const CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.loading) {
                      body = const CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = const Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = const Text("release to load more");
                    } else {
                      body = const Text("No more Data");
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                onLoading: () async {
                  if (state.isNext) {
                    controller.loadMoreSearch(
                        refresh: true, query: widget.query);
                    refreshController.loadComplete();
                  } else {
                    refreshController.loadNoData();
                  }
                },
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.melmod.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final melmod = state.melmod[index];
                    return InkWell(
                      onTap: () =>
                          AdAppLovinNetwork().showAdIntersApplovin(DetailView(
                        url: melmod.url,
                        image: melmod.image,
                      )),
                      child: MelmodContent(
                        melmod: melmod,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return index % 5 == 0
                        ? ApplovinAdNetwork().showNativeAppLovin()
                        : SizedBox();
                  },
                ),
              )),
    );
  }
}
