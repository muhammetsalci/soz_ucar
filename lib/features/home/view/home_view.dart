import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ozlu_sozler_flutter/core/base/view/base_widget.dart';
import 'package:ozlu_sozler_flutter/features/home/view-model/home_view_model.dart';
import 'package:ozlu_sozler_flutter/screens/category_screen.dart';
import 'package:ozlu_sozler_flutter/screens/random_quote_screen.dart';
import 'package:ozlu_sozler_flutter/utils/colors.dart';
import 'package:ozlu_sozler_flutter/widgets/app_name.widget.dart';
import 'package:ozlu_sozler_flutter/widgets/bannerAd_widget.dart';
import 'package:ozlu_sozler_flutter/widgets/drawer_widget.dart';
import 'package:ozlu_sozler_flutter/widgets/home_screen_item_deneme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }
}

  @override
  Widget buildScaffoldBody(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: ColorItems.background,
      key: viewModel.scaffoldKey,
      drawer: DrawerWidget(scaffoldKey: viewModel.scaffoldKey),
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
                            viewModel.scaffoldKey.currentState?.openDrawer();
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
                Lottie.asset(
                  "assets/lottie/logo.json",
                  height: 100.h,
                ),
              ],
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenItemDeneme(
                      page: RandomQuoteScreen(),
                      text: 'Rastgele Söz',
                      lottieAsset: 'random.json',
                      position: 'topLeft',
                    ),
                    HomeScreenItemDeneme(
                      page: CategoryScreen(),
                      text: 'Kategoriler',
                      lottieAsset: 'category.json',
                      position: 'topRight',
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeScreenItemDeneme(
                      text: 'Favoriler',
                      lottieAsset: 'fav.json',
                      position: 'bottomLeft',
                    ),
                    HomeScreenItemDeneme(
                      text: 'Geri Bildirim',
                      lottieURL:
                          'https://assets7.lottiefiles.com/packages/lf20_6PnLAF.json',
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
        googleAds: viewModel.googleAds,
      ),
    );
  }

