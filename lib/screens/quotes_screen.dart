// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ozlu_sozler_flutter/features/category/model/category_model.dart';
import 'package:ozlu_sozler_flutter/services/google_ads.dart';
import 'package:ozlu_sozler_flutter/widgets/main_list_view_widget.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import '../widgets/bannerAd_widget.dart';

class QuotesScreen extends StatefulWidget {
  final List<CategoryModel>? items;
  final String selectedCategory;
  const QuotesScreen({
    Key? key,
    required this.items,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GoogleAds _googleAds = GoogleAds();

  @override
  void initState() {
    super.initState();
    _googleAds.loadIntersititalAd();
    _googleAds.loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorItems.background,
      appBar: AppBar(
        backgroundColor: ColorItems.primaryColor,
        title: Text(StringItems.appName),
      ),
      /* drawer: DrawerWidget(
        scaffoldKey: _scaffoldKey,
      ), */
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5.0.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: ColorItems.shadowColor,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 60.h,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.selectedCategory,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: ColorItems.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: MainListView(
                  items: widget.items,
                  selectedCategory: widget.selectedCategory)),
        ],
      ),
      bottomNavigationBar: BannerAdWidget(
        googleAds: _googleAds,
      ),
    );
  }
}
