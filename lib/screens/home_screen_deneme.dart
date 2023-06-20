import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:ozlu_sozler_flutter/screens/category_screen.dart';
import 'package:ozlu_sozler_flutter/screens/random_quote_screen.dart';
import 'package:ozlu_sozler_flutter/widgets/app_name.widget.dart';
import 'package:ozlu_sozler_flutter/widgets/drawer_widget.dart';
import 'package:ozlu_sozler_flutter/widgets/home_screen_item_deneme.dart';
import 'package:toast/toast.dart';

import '../uitils/colors.dart';
import '../services/google_ads.dart';
import '../widgets/bannerAd_widget.dart';

class HomeScreenDeneme extends StatefulWidget {
  const HomeScreenDeneme({super.key});

  @override
  State<HomeScreenDeneme> createState() => _HomeScreenDenemeState();
}

class _HomeScreenDenemeState extends State<HomeScreenDeneme> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleAds _googleAds = GoogleAds();

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  var testUnit = 'ca-app-pub-3940256099942544/6300978111';
  var adUnit = 'ca-app-pub-4045640849423737/5516733133';

  initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (kDebugMode) {
            print("hata yok");
          }
          setState(() {
            isAdLoaded = true;
          });
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

  @override
  void initState() {
    super.initState();
    _googleAds.loadIntersititalAd(showAfterLoad: false);
    _googleAds.loadBannerAd(adLoaded: () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: ColorItems.background,
      key: _scaffoldKey,
      /*  appBar: AppBar(
        backgroundColor: ColorItems.primaryColor,
        title: const Text(StringItems.appName),
      ), */
      drawer: DrawerWidget(scaffoldKey: _scaffoldKey),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: ColorItems.secondaryColor,
                        elevation: 5,
                        child: IconButton(
                          color: ColorItems.primaryColor,
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                        ),
                      ),
                      const AppNameWidget(),
                      TextButton(onPressed: () {}, child: const Text(''))
                    ],
                  ),
                ),
                //SizedBox(height: 20.h),
                Lottie.asset(
                  "assets/lottie/logo.json",
                  height: 100.h,
                ),
                //SizedBox(height: 40.h),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenItemDeneme(
                      page: const RandomQuoteScreen(),
                      text: 'Rastgele Söz',
                      lottieAsset:
                          'random.json',
                      position: 'topLeft',
                    ),
                    HomeScreenItemDeneme(
                      page: const CategoryScreen(),
                      text: 'Kategoriler',
                      lottieAsset:
                          'category.json',
                      position: 'topRight',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenItemDeneme(
                      text: 'Favoriler',
                      lottieAsset:
                          'fav.json',
                      position: 'bottomLeft',
                    ),
                    HomeScreenItemDeneme(
                      text: 'Geri Bildirim',
                      lottieURL: 'https://assets7.lottiefiles.com/packages/lf20_6PnLAF.json',
                      position: 'bottomRight',
                    ),
                  ],
                ),
                Lottie.network(
                  'https://assets5.lottiefiles.com/private_files/lf30_cldvedro.json',
                  //width: MediaQuery.of(context).size.width,
                  height: 300.h,
                  //animate: false,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdWidget(
        googleAds: _googleAds,
      ),
    );
  }
}
