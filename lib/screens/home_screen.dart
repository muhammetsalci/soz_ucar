import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:ozlu_sozler_flutter/screens/category_screen.dart';
import 'package:ozlu_sozler_flutter/screens/random_quote_screen.dart';
import 'package:ozlu_sozler_flutter/widgets/app_name.widget.dart';
import 'package:ozlu_sozler_flutter/widgets/drawer_widget.dart';
import 'package:toast/toast.dart';

import '../uitils/colors.dart';
import '../services/google_ads.dart';
import '../widgets/bannerAd_widget.dart';
import '../widgets/home_screen_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30.h,
            ),
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
            Center(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Lottie.network(
                    'https://lottie.host/c9022a0d-10c2-4fac-894f-5e4b86c5ec7a/5NPZsTMfhf.json',
                    //width: MediaQuery.of(context).size.width,
                    height: 100.h,
                    //animate: false,
                  ),
                  SizedBox(height: 20.h),
                  HomeScreenItem(
                    page: const RandomQuoteScreen(),
                    text: 'Rastgele Söz',
                    //icon: Icons.shuffle,
                    lottie:
                        'https://lottie.host/a50a4bb4-0011-4c78-bc45-ea3bc98aaa9c/L0T3dWFuI4.json',
                  ),
                  HomeScreenItem(
                    page: const CategoryScreen(),
                    text: 'Kategoriler',
                    //icon: Icons.category,
                    lottie:
                        'https://lottie.host/837db5a1-beac-418d-9c09-c2104011a622/ajKa1LbLhW.json',
                  ),
                  HomeScreenItem(
                    text: 'Favoriler',
                    //icon: Icons.favorite,
                    lottie:
                        'https://lottie.host/c180b6d2-80ca-4514-a8f5-299d674f6115/GbcC0UusXx.json',
                  ),
                ],
              ),
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
