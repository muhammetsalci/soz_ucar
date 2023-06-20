import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ozlu_sozler_flutter/model/model.dart';
import 'package:ozlu_sozler_flutter/widgets/random_list_view_widget.dart';
import 'package:provider/provider.dart';

import '../uitils/colors.dart';
import '../provider.dart';
import '../services/google_ads.dart';
import '../services/service.dart';
import '../uitils/strings.dart';

class RandomQuoteScreen extends StatefulWidget {
  const RandomQuoteScreen({super.key});

  @override
  State<RandomQuoteScreen> createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  List<PostModel>? _items;
  late final PostService _postService;

  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late BannerAd bannerAd;
  bool isAdLoaded = false;
  var testUnit = 'ca-app-pub-3940256099942544/6300978111';
  var adUnit = 'ca-app-pub-4045640849423737/5516733133';
  final GoogleAds _googleAds = GoogleAds();

  late int number;

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

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchPostItemsAdvance();
    _googleAds.loadIntersititalAd();
    _googleAds.loadBannerAd(adLoaded: () {
      setState(() {});
    });
  }

  fetchPostItemsAdvance() async {
    changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    if (_items == null) {
      //log('API veri çekme hatası:', error: _postService.message);
      _apiShowDialog(_postService.message);
    }
    number = Random().nextInt(_items!.length);
    changeLoading();
  }

  void _apiShowDialog(Object message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("Tamam"),
              )
            ],
            title: const Center(child: Text('SUNUCU HATASI!')),
            content: Text(
              '$message\n\nLütfen geri bildirimde bulunun!',
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorItems.background,
      appBar: AppBar(
        backgroundColor: ColorItems.primaryColor,
        title: Text(StringItems.appName),
      ),
      /* drawer: DrawerWidget(
        scaffoldKey: scaffoldKey,
      ), */
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RandomListView(
                    items: _items,
                    randomNumber: number,
                  ),
                  /* Center(
                    child:
                        Consumer<MyProvider>(builder: (context, myProvider, _) {
                      reklam = myProvider.myVariable;
                      return Text(
                        'My variable value is ${myProvider.myVariable}',
                      );
                    }),
                  ), */
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorItems.primaryColor),
                    onPressed: () {
                      Provider.of<MyProvider>(context, listen: false)
                          .setMyVariable();
                      setState(() {
                        number = Random().nextInt(_items!.length);
                      });
                      if (Provider.of<MyProvider>(context, listen: false)
                                  .myVariable %
                              5 ==
                          0) {
                        if (kDebugMode) {
                          print(Provider.of<MyProvider>(context, listen: false)
                              .myVariable);
                        }
                        //_googleAds.showInterstitalAd();
                        _googleAds.loadIntersititalAd(showAfterLoad: true);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.refresh,
                          color: ColorItems.secondaryColor,
                        ),
                        Text(
                          'Rastgele Söz',
                          style: TextStyle(color: ColorItems.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      /* bottomNavigationBar: _googleAds.bannerAd != null
      ?SizedBox(
        width: _googleAds.bannerAd!.size.width.toDouble(),
        height: _googleAds.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _googleAds.bannerAd!),
      ): SizedBox(), */
    );
  }
}
