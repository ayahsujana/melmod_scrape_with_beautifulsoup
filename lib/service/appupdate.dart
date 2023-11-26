import 'package:blocwithgetit/model/appupdates.dart';
import 'package:dio/dio.dart';

import '../Util/Constant/config.dart';

class AppUpdatesServices {
  Future<List<Ad>> getDataAds() async {
    List<Ad> ad = [];
    var response = await Dio().get(
      baseUrl + idsAds,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    try {
      if (response.statusCode == 200) {
        final data = AppUpdates.fromJson(response.data);
        ad.addAll(data.ads);
      } else {
        Future.error('Not found data');
      }
    } catch (e) {
      Future.error(e);
    }
    return ad;
  }

  Future<List<App>> getDataApp() async {
    List<App> app = [];
    var response = await Dio().get(
      baseUrl + idsAds,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    try {
      if (response.statusCode == 200) {
        final data = AppUpdates.fromJson(response.data);
        app.add(data.app);
      } else {
        Future.error('Not found data');
      }
    } catch (e) {
      Future.error(e);
    }
    return app;
  }
}
