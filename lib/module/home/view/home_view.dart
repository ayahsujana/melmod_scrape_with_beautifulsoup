import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/Util/Constant/app_info.dart';
import 'package:blocwithgetit/core.dart';
import 'package:blocwithgetit/module/Settings/about_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<HomeController>()) {
      GetIt.I.unregister<HomeController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();

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
      child: BlocListener<HomeController, HomeState>(
        listener: (context, state) {},
        child: BlocBuilder<HomeController, HomeState>(
          builder: (context, state) {
            final bloc = context.read<HomeController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    HomeController controller,
    HomeState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          appName,
          style: GoogleFonts.cousine(
              fontWeight: FontWeight.bold, color: Colors.green),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(AboutInfo()),
            icon: const Icon(
              Icons.info,
              size: 30.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: state.isLoading
          ? loading()
          : LoadingSwitcher(
              loading: state.isLoading,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.deepPurple.shade50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5.0, left: 10, right: 10, top: 5),
                      child: Container(
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 5.0,
                        //   horizontal: 12.0,
                        // ),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          // borderRadius: const BorderRadius.all(
                          //   Radius.circular(20.0),
                          // ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey[500],
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: controller.textController,
                                decoration: InputDecoration.collapsed(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  hintText:
                                      "Search mods, skins, weapons and more...",
                                  hintStyle: GoogleFonts.cousine(fontSize: 12),
                                  hoverColor: Colors.transparent,
                                ),
                                onFieldSubmitted: (value) {
                                  controller.textController.text = value;
                                  Get.to(SearchModView(
                                      query: controller.textController.text));
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.textController.clear(),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SmartRefresher(
                      controller: controller.refreshController,
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
                          controller.loadMoreMelmod(refresh: true);
                          controller.refreshController.loadComplete();
                        } else {
                          controller.refreshController.loadNoData();
                        }
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.melmod.length,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final melmod = state.melmod[index];
                          return InkWell(
                            onTap: () => AdAppLovinNetwork()
                                .showAdIntersApplovin(DetailView(
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
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
