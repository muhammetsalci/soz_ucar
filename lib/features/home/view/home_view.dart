import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:soz_ucar/core/base/view/base_widget.dart';
import 'package:soz_ucar/features/category/view/category_view.dart';
import 'package:soz_ucar/features/home/view-model/home_view_model.dart';
import 'package:soz_ucar/features/home/widgets/home_screen_item.dart';
import 'package:soz_ucar/features/random_quote/view/random_quote_view.dart';
import 'package:soz_ucar/utils/colors.dart';
import 'package:soz_ucar/core/widgets/app_name.widget.dart';
import 'package:soz_ucar/core/widgets/bannerAd_widget.dart';
import 'package:soz_ucar/core/widgets/custom_appbar.dart';
import 'package:soz_ucar/features/home/widgets/drawer_widget.dart';

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
buildScaffoldBody(BuildContext context, HomeViewModel viewModel) {
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
              //buildAppName(viewModel, context),
              CustomAppbar(
                customOnPressed: () {
                  viewModel.scaffoldKey.currentState?.openDrawer();
                },
                customIcon: const Icon(Icons.menu),
              ),
              Lottie.asset(
                "assets/lottie/logo.json",
                height: 100.h,
              ),
            ],
          ),
          buildPageButtons(),
        ],
      ),
    ),
    bottomNavigationBar: BannerAdWidget(
      googleAds: viewModel.googleAds,
    ),
  );
}

buildPageButtons() {
  return Column(
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeScreenItem(
            page: RandomQuoteView(),
            text: 'Rastgele Söz',
            lottieAsset: 'random.json',
            position: 'topLeft',
          ),
          HomeScreenItem(
            page: CategoryView(),
            text: 'Kategoriler',
            lottieAsset: 'category.json',
            position: 'topRight',
          ),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeScreenItem(
            text: 'Favoriler',
            lottieAsset: 'fav.json',
            position: 'bottomLeft',
          ),
          HomeScreenItem(
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
  );
}

buildAppName(HomeViewModel viewModel, BuildContext context) {
  return Padding(
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
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        AppNameWidget(),
        const TextButton(onPressed: null, child: Text(''))
      ],
    ),
  );
}
