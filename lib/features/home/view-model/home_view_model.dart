import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobx/mobx.dart';
import 'package:ozlu_sozler_flutter/services/google_ads.dart';
import '../../../core/base/model/base_view_model.dart';
part 'home_view_model.g.dart';

// ignore: library_private_types_in_public_api
class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase extends BaseViewModel  with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleAds googleAds = GoogleAds();

  
  @override
  void init() {
    googleAds.loadIntersititalAd(showAfterLoad: false);
    googleAds.loadBannerAd();
    if (kDebugMode) {
      print(googleAds.bannerAd);
    }
  }

  
  @override
  void setContext(BuildContext context) {
    viewContext = context;
  }

  @observable
  late BannerAd bannerAd;
  @observable
  bool isAdLoaded = false;
  var testUnit = 'ca-app-pub-3940256099942544/6300978111';
  var adUnit = 'ca-app-pub-4045640849423737/5516733133';

  @action
  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (kDebugMode) {
            print("hata yok");
          }
          isAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (kDebugMode) {
            print("hata mesajı: $error");
          }
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }
}
