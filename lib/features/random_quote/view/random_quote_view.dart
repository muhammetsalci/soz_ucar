import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:soz_ucar/core/base/view/base_widget.dart';
import 'package:soz_ucar/features/random_quote/view-model/random_quote_view_model.dart';
import 'package:soz_ucar/provider.dart';
import 'package:soz_ucar/utils/colors.dart';
import 'package:soz_ucar/core/widgets/bannerAd_widget.dart';
import 'package:soz_ucar/features/random_quote/widgets/random_list_view_widget.dart';
import 'package:soz_ucar/core/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class RandomQuoteView extends StatelessWidget {
  const RandomQuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<RandomQuoteViewModel>(
      viewModel: RandomQuoteViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RandomQuoteViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  buildScaffoldBody(BuildContext context, RandomQuoteViewModel viewModel) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: ColorItems.background,
        body: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomAppbar(
                      customOnPressed: () {
                        Navigator.pop(context);
                      },
                      customIcon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    Column(
                      children: [
                        RandomListView(
                          items: viewModel.items,
                          randomNumber: viewModel.number,
                        ),
                        buildRandomButton(context, viewModel),
                      ],
                    ),
                    const TextButton(onPressed: null, child: Text(''))
                  ],
                ),
              ),
        bottomNavigationBar: BannerAdWidget(
          googleAds: viewModel.googleAds,
        ),
      );
    });
  }

  buildRandomButton(BuildContext context, RandomQuoteViewModel viewModel) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: ColorItems.primaryColor),
      onPressed: () {
        Provider.of<MyProvider>(context, listen: false).setMyVariable();
        viewModel.number = Random().nextInt(viewModel.items!.length);
        if (Provider.of<MyProvider>(context, listen: false).myVariable % 5 ==
            0) {
          if (kDebugMode) {
            print(Provider.of<MyProvider>(context, listen: false).myVariable);
          }
          viewModel.googleAds.loadIntersititalAd(showAfterLoad: true);
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
    );
  }
}
