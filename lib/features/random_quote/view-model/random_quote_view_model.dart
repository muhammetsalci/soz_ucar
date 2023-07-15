import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:soz_ucar/features/random_quote/model/random_quote_model.dart';
import 'package:soz_ucar/features/random_quote/service/random_quote_service.dart';
import 'package:soz_ucar/services/google_ads.dart';
import 'package:soz_ucar/core/base/model/base_view_model.dart';
part 'random_quote_view_model.g.dart';

// ignore: library_private_types_in_public_api
class RandomQuoteViewModel = _RandomQuoteViewModelBase
    with _$RandomQuoteViewModel;

abstract class _RandomQuoteViewModelBase extends BaseViewModel with Store {
  final GoogleAds googleAds = GoogleAds();

  @override
  void init() {
    randomQuoteService = RandomQuoteService();
    fetchPostItemsAdvance();
    googleAds.loadIntersititalAd();
    googleAds.loadBannerAd();
  }

  @override
  void setContext(BuildContext context) {
    viewContext = context;
  }

  @observable
  List<RandomQuoteReSponseModel>? items;
  @observable
  RandomQuoteService randomQuoteService = RandomQuoteService();
  @observable
  bool isLoading = false;
  @observable
  int number = 0;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  bool isApiCallProcess = false;

  @action
  fetchPostItemsAdvance() async {
    changeLoading();
    items = await randomQuoteService.fetchPostItemsAdvance();
    if (items == null) {
      if (kDebugMode) {
        print('API veri çekme hatası: ${randomQuoteService.message}');
      }
      apiShowDialog(randomQuoteService.message);
    }
    number = Random().nextInt(items!.length);
    changeLoading();
  }

  @action
  void apiShowDialog(Object message) {
    showDialog(
        context: viewContext!,
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
}
