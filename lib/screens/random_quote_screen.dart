import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ozlu_sozler_flutter/features/random_quote/model/random_quote_model.dart';
import 'package:ozlu_sozler_flutter/features/random_quote/service/random_quote_service.dart';
import 'package:ozlu_sozler_flutter/widgets/bannerAd_widget.dart';
import 'package:ozlu_sozler_flutter/features/random_quote/widgets/random_list_view_widget.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../provider.dart';
import '../services/google_ads.dart';
import '../utils/strings.dart';

class RandomQuoteScreen extends StatefulWidget {
  const RandomQuoteScreen({super.key});

  @override
  State<RandomQuoteScreen> createState() => _RandomQuoteScreenState();
}

class _RandomQuoteScreenState extends State<RandomQuoteScreen> {
  List<RandomQuoteReSponseModel>? _items;
  late final RandomQuoteService _postService;

  bool isLoading = false;
  final GoogleAds _googleAds = GoogleAds();

  late int number;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    _postService = RandomQuoteService();
    fetchPostItemsAdvance();
    _googleAds.loadIntersititalAd();
    _googleAds.loadBannerAd();
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
    return Scaffold(
      backgroundColor: ColorItems.background,
      appBar: AppBar(
        backgroundColor: ColorItems.primaryColor,
        title: Text(StringItems.appName),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RandomListView(
                    items: _items,
                    randomNumber: number,
                  ),
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
                          print(Provider.of<MyProvider>(context,
                                  listen: false)
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
                          style:
                              TextStyle(color: ColorItems.secondaryColor),
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
      /* bottomNavigationBar: _googleAds.bannerAd != null
      ?SizedBox(
        width: _googleAds.bannerAd!.size.width.toDouble(),
        height: _googleAds.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: _googleAds.bannerAd!),
      ): SizedBox(), */
    );
  }
}
