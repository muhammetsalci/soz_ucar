import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;

  final adUnitIdIntersitital = Platform.isAndroid
      ? 'ca-app-pub-4045640849423737/8834516256'
      : 'ca-app-pub-4045640849423737/1934614724';

  final adUnitIdBanner = Platform.isAndroid
      ? 'ca-app-pub-4045640849423737/5516733133'
      : 'ca-app-pub-4045640849423737/4036936402';

  void loadIntersititalAd({bool showAfterLoad = false}) {
    InterstitialAd.load(
        adUnitId: adUnitIdIntersitital,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            interstitialAd = ad;
            if (showAfterLoad) showInterstitalAd();
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  void showInterstitalAd() {
    if (interstitialAd != null) {
      interstitialAd!.show();
      if (kDebugMode) {
        print("interstital çalıştı");
      }
    }
  }

  void loadBannerAd({required VoidCallback adLoaded}) {
    bannerAd = BannerAd(
      adUnitId: adUnitIdBanner,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          bannerAd = ad as BannerAd?;
          adLoaded();
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }
}
