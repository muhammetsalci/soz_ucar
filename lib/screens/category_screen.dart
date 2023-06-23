import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ozlu_sozler_flutter/screens/quotes_screen.dart';
import 'package:ozlu_sozler_flutter/services/service.dart';
import 'package:ozlu_sozler_flutter/uitils/strings.dart';
import 'package:ozlu_sozler_flutter/widgets/bannerAd_widget.dart';

import '../uitils/colors.dart';
import '../model/model.dart';
import '../services/google_ads.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<PostModel>? _items;
  late final PostService _postService;
  List numberOfCategories = [];
  String selectedCategory = '';
  int _selectedIndex = -1;

  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
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
    if (_items != null) {
      for (var item in _items!) {
        numberOfCategories.add(item.userId);
      }
      numberOfCategories = numberOfCategories.toSet().toList();
      debugPrint("kategori sayısı: ${numberOfCategories.length}");
    } else {
      log('API veri çekme hatası:', error: _postService.message);
      _apiShowDialog(_postService.message);
    }

    changeLoading();
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : categoryListView(),
      bottomNavigationBar: BannerAdWidget(
        googleAds: _googleAds,
      ),
    );
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

  Widget categoryListView() {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 160,
          childAspectRatio: 3 / 2,
          //crossAxisSpacing: 10,
          //mainAxisSpacing: 10,
          //mainAxisExtent: 20,
        ),
        controller: _scrollController,
        itemCount: numberOfCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
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
                height: 70.h,
                width: 115.w,
                child:
                    categoryButton(context, numberOfCategories[index], index)),
          );
        },
      ),
    );
  }

  ElevatedButton categoryButton(
      BuildContext context, String category, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: ColorItems.background),
      onPressed: () {
        /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuotesScreen(
                    items: _items,
                    selectedCategory: category,
                  )),
        ); */
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => QuotesScreen(
              items: _items,
              selectedCategory: category,
            ),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
        setState(() {
          selectedCategory = category;
          _selectedIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: ColorItems.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}