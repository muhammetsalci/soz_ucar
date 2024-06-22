import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;

  final adUnitIdIntersitital = 'api_key';

  final adUnitIdBanner = 'api_key';

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

  void loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: adUnitIdBanner,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          bannerAd = ad as BannerAd?;
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }
}
