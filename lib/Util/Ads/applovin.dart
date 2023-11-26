import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../state_util.dart';
import '../Constant/ad_unit.dart';

enum AdLoadState { notLoaded, loading, loaded }

class AdAppLovinNetwork {
  var _isInitialized = false;
  var _interstitialRetryAttempt = 0;
  static int counterInters = 0;
  static int? CAP;
  var _rewardedAdRetryAttempt = 0;
  static const double _kMediaViewAspectRatio = 16 / 9;
  double _mediaViewAspectRatio = _kMediaViewAspectRatio;
  final MaxNativeAdViewController _nativeAdViewController =
      MaxNativeAdViewController();

  Future<void> initializePlugin() async {
    print("Initializing SDK...");

    Map? configuration = await AppLovinMAX.initialize(sdkKeyAppLovin);
    if (configuration != null) {
      _isInitialized = true;

      print("SDK Initialized: $configuration");

      //ApplovinAdNetwork applovin = Get.put(ApplovinAdNetwork());
      //print('APPLOVIN ===>>> $applovin');
    }
  }

  void showAdIntersApplovin(dynamic toClass) async {
    counterInters = counterInters + 1;
    print('COUNTERINTERS :: >> $counterInters');
    bool isReady = (await AppLovinMAX.isInterstitialReady(appLovinInters))!;
    if (counterInters >= CAP!) {
      if (isReady) {
        AppLovinMAX.showInterstitial(appLovinInters);
        AppLovinMAX.setInterstitialListener(InterstitialListener(
          onAdLoadedCallback: (ad) {
            //_interstitialLoadState = AdLoadState.loaded;

            // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialAdReady(_interstitial_ad_unit_id) will now return 'true'
            print('Interstitial ad loaded from ${ad.networkName}');

            // Reset retry attempt
            _interstitialRetryAttempt = 0;
          },
          onAdLoadFailedCallback: (adUnitId, error) {
            //_interstitialLoadState = AdLoadState.notLoaded;

            // Interstitial ad failed to load
            // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
            _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

            int retryDelay = pow(2, min(6, _interstitialRetryAttempt)).toInt();
            Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
              AppLovinMAX.loadInterstitial(appLovinInters);
            });
            Get.to(toClass);
          },
          onAdDisplayedCallback: (ad) {
            print('Interstitial ad displayed');
          },
          onAdDisplayFailedCallback: (ad, error) {
            //_interstitialLoadState = AdLoadState.notLoaded;
            AppLovinMAX.loadInterstitial(appLovinInters);
          },
          onAdClickedCallback: (ad) {
            print('Interstitial ad clicked');
          },
          onAdHiddenCallback: (ad) {
            // _interstitialLoadState = AdLoadState.notLoaded;
            print('Interstitial ad hidden');
            Get.to(toClass);
          },
          onAdRevenuePaidCallback: (ad) {
            print('Interstitial ad revenue paid: ${ad.revenue}');
          },
        ));
      } else {
        //_interstitialLoadState = AdLoadState.loading;
        AppLovinMAX.loadInterstitial(appLovinInters);
        Get.to(toClass);
      }
      counterInters = 0;
    } else {
      AppLovinMAX.loadInterstitial(appLovinInters);
      Get.to(toClass);
    }
  }

  void showAdRewardApplovin(dynamic toClass) async {
    bool isReady = (await AppLovinMAX.isRewardedAdReady(appLovinReward))!;
    print('ISREADY IS ===>>> $isReady');
    if (isReady) {
      AppLovinMAX.showRewardedAd(appLovinReward);
      AppLovinMAX.setRewardedAdListener(
          RewardedAdListener(onAdLoadedCallback: (ad) {
        //_rewardedAdLoadState = AdLoadState.loaded;

        // Rewarded ad is ready to be shown. AppLovinMAX.isRewardedAdReady(_rewarded_ad_unit_id) will now return 'true'
        print('Rewarded ad loaded from ${ad.networkName}');

        // Reset retry attempt
        _rewardedAdRetryAttempt = 0;
      }, onAdLoadFailedCallback: (adUnitId, error) {
        //_rewardedAdLoadState = AdLoadState.notLoaded;

        // Rewarded ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        _rewardedAdRetryAttempt = _rewardedAdRetryAttempt + 1;

        int retryDelay = pow(2, min(6, _rewardedAdRetryAttempt)).toInt();
        print('RETRYDELAY ===>>> $retryDelay');
        print(
            'Rewarded ad failed to load with code ${error.code} - retrying in ${retryDelay}s');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadRewardedAd(appLovinReward);
        });
      }, onAdDisplayedCallback: (ad) {
        print('Rewarded ad displayed');
      }, onAdDisplayFailedCallback: (ad, error) {
        //_rewardedAdLoadState = AdLoadState.notLoaded;
        AppLovinMAX.loadInterstitial(appLovinReward);
      }, onAdClickedCallback: (ad) {
        print('Rewarded ad clicked');
      }, onAdHiddenCallback: (ad) {
        //_rewardedAdLoadState = AdLoadState.notLoaded;
        print('Rewarded ad hidden');
      }, onAdReceivedRewardCallback: (ad, reward) {
        print('Rewarded ad granted reward');
      }, onAdRevenuePaidCallback: (ad) {
        print('Rewarded ad revenue paid: ${ad.revenue}');
      }));
    } else {
      //_rewardedAdLoadState = AdLoadState.loading;
      AppLovinMAX.loadRewardedAd(appLovinReward);
      Get.to(toClass);
    }
  }

  Widget showBannerAppLovin() {
    return appLovinBanner == "0"
        ? SizedBox()
        : MaxAdView(
            adUnitId: appLovinBanner,
            adFormat: AdFormat.banner,
            listener: AdViewAdListener(onAdLoadedCallback: (ad) {
              print('Banner widget ad loaded from ${ad.networkName}');
            }, onAdLoadFailedCallback: (adUnitId, error) {
              print(
                  'Banner widget ad failed to load with error code ${error.code} and message: ${error.message}');
            }, onAdClickedCallback: (ad) {
              print('Banner widget ad clicked');
            }, onAdExpandedCallback: (ad) {
              print('Banner widget ad expanded');
            }, onAdCollapsedCallback: (ad) {
              print('Banner widget ad collapsed');
            }, onAdRevenuePaidCallback: (ad) {
              print('Banner widget ad revenue paid: ${ad.revenue}');
            }));
  }
}

class ApplovinAdNetwork {
  static const double _kMediaViewAspectRatio = 16 / 9;
  double _mediaViewAspectRatio = _kMediaViewAspectRatio;
  final MaxNativeAdViewController _nativeAdViewController =
      MaxNativeAdViewController();

  Widget showNativeAppLovin() {
    return appLovinNative == "0"
        ? SizedBox()
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 300,
            color: Colors.white,
            child: MaxNativeAdView(
              adUnitId: appLovinNative,
              controller: _nativeAdViewController,
              listener: NativeAdListener(onAdLoadedCallback: (ad) {
                _mediaViewAspectRatio = ad.nativeAd?.mediaContentAspectRatio ??
                    _kMediaViewAspectRatio;
              }, onAdLoadFailedCallback: (adUnitId, error) {
                print('APPLOVIN ERRROR GUYS');
                //logStatus(
                //  'Native ad failed to load with error code ${error.code} and message: ${error.message}');
              }, onAdClickedCallback: (ad) {
                //logStatus('Native ad clicked');
              }, onAdRevenuePaidCallback: (ad) {
                // logStatus('Native ad revenue paid: ${ad.revenue}');
              }),
              child: Container(
                color: const Color(0xffffff),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: const MaxNativeAdIconView(
                            width: 48,
                            height: 48,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.5),
                                        borderRadius: BorderRadius.circular(2)),
                                    child: Center(
                                        child: Text(
                                      'Ad',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.green),
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Expanded(
                                    child: MaxNativeAdTitleView(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  const MaxNativeAdOptionsView(
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                              MaxNativeAdAdvertiserView(
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10,
                                    color: Colors.black54),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                              MaxNativeAdStarRatingView(
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: MaxNativeAdBodyView(
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black54),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: _mediaViewAspectRatio,
                        child: const MaxNativeAdMediaView(),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaxNativeAdCallToActionView(
                        style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.blue),
                          textStyle: MaterialStatePropertyAll<TextStyle>(
                              TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget showNativeBannerAppLovin() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 100,
        width: double.infinity,
        // decoration: BoxDecoration(border: Border.all(color: PRIMARY_COLOR)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: MaxNativeAdView(
            adUnitId: appLovinNative,
            controller: _nativeAdViewController,
            listener: NativeAdListener(onAdLoadedCallback: (ad) {
              _mediaViewAspectRatio = ad.nativeAd?.mediaContentAspectRatio ??
                  _kMediaViewAspectRatio;
            }, onAdLoadFailedCallback: (adUnitId, error) {
              print('APPLOVIN ERRROR GUYS');
              //logStatus(
              //  'Native ad failed to load with error code ${error.code} and message: ${error.message}');
            }, onAdClickedCallback: (ad) {
              //logStatus('Native ad clicked');
            }, onAdRevenuePaidCallback: (ad) {
              // logStatus('Native ad revenue paid: ${ad.revenue}');
            }),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  height: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _mediaViewAspectRatio,
                    child: const MaxNativeAdMediaView(),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: MaxNativeAdTitleView(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                                maxLines: 1,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            MaxNativeAdOptionsView(
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: MaxNativeAdAdvertiserView(
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 9),
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          MaxNativeAdStarRatingView(
                            size: 10,
                          ),
                        ],
                      ),
                      MaxNativeAdBodyView(
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height:5.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 35,
                        child: MaxNativeAdCallToActionView(
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.green),
                            textStyle: MaterialStatePropertyAll<TextStyle>(
                                TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onInit() {
    _nativeAdViewController.loadAd();
  }

  void dispose() {
    _nativeAdViewController.dispose();
  }
}
