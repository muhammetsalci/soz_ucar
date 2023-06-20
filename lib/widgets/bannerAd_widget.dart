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
    if (widget.googleAds.bannerAd != null) {
      return SizedBox(
        width: widget.googleAds.bannerAd!.size.width.toDouble(),
        height: widget.googleAds.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: widget.googleAds.bannerAd!),
      );
    }
    return const SizedBox();
  }
}
