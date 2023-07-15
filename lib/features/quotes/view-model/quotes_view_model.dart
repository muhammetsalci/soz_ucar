import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:soz_ucar/core/base/model/base_view_model.dart';
import 'package:soz_ucar/services/google_ads.dart';
part 'quotes_view_model.g.dart';

// ignore: library_private_types_in_public_api
class QuotesViewModel = _QuotesViewModelBase with _$QuotesViewModel;

abstract class _QuotesViewModelBase extends BaseViewModel with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleAds googleAds = GoogleAds();

  @override
  void init() {
    googleAds.loadIntersititalAd();
    googleAds.loadBannerAd();
  }

  @override
  void setContext(BuildContext context) {
    viewContext = context;
  }
}
