import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../services/google_ads.dart';

class BannerAdWidget extends StatefulWidget {
  final GoogleAds googleAds;
  const BannerAdWidget({required this.googleAds, super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.googleAds.bannerAd);
    }
    if (widget.googleAds.bannerAd != null) {
      if (kDebugMode) {
        print("banner çalıştı");
      }
      return SizedBox(
        width: widget.googleAds.bannerAd!.size.width.toDouble(),
        height: widget.googleAds.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: widget.googleAds.bannerAd!),
      );
    } else {
      if (kDebugMode) {
        print("banner çalışmadı");
      }
      return const SizedBox();
    }
  }
}
