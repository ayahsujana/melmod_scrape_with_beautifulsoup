import 'dart:io';

import 'package:blocwithgetit/Util/Ads/applovin.dart';
import 'package:blocwithgetit/core.dart';
import 'package:blocwithgetit/service/appupdate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class SplashController extends Cubit<SplashState> implements IBlocBase {
  SplashController() : super(SplashState());

  @override
  void initState() {
    getIdsAds();
    checkNetwork();
    ApplovinAdNetwork().onInit();
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }

  getIdsAds() async {
    state.ad = await AppUpdatesServices().getDataAds();
    state.app = await AppUpdatesServices().getDataApp();
    emit(state.copyWith());
  }

  Future checkNetwork() async {
    try {
      final res = await InternetAddress.lookup('google.com');
      if (res.isNotEmpty && res[0].rawAddress.isNotEmpty) {
        state.isReady = true;
        await Future.delayed(const Duration(seconds: 2), () {
          Get.offAll(HomeView());
        });
      }
    } on SocketException catch (_) {
      state.isReady = false;
    }
  }
}
