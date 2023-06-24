import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ozlu_sozler_flutter/core/base/view/base_widget.dart';
import 'package:ozlu_sozler_flutter/features/random_quote/view-model/random_quote_view_model.dart';
import 'package:ozlu_sozler_flutter/provider.dart';
import 'package:ozlu_sozler_flutter/utils/colors.dart';
import 'package:ozlu_sozler_flutter/utils/strings.dart';
import 'package:ozlu_sozler_flutter/widgets/bannerAd_widget.dart';
import 'package:ozlu_sozler_flutter/features/random_quote/widgets/random_list_view_widget.dart';
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

  Widget buildScaffoldBody(
      BuildContext context, RandomQuoteViewModel viewModel) {
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: ColorItems.background,
        appBar: AppBar(
          backgroundColor: ColorItems.primaryColor,
          title: Text(StringItems.appName),
        ),
        body: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RandomListView(
                      items: viewModel.items,
                      randomNumber: viewModel.number,
                    ),
                    buildRandomButton(context, viewModel),
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
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorItems.primaryColor),
                    onPressed: () {
                      Provider.of<MyProvider>(context, listen: false)
                          .setMyVariable();
                      viewModel.number =
                          Random().nextInt(viewModel.items!.length);
                      if (Provider.of<MyProvider>(context, listen: false)
                                  .myVariable %
                              5 ==
                          0) {
                        if (kDebugMode) {
                          print(
                              Provider.of<MyProvider>(context, listen: false)
                                  .myVariable);
                        }
                        viewModel.googleAds
                            .loadIntersititalAd(showAfterLoad: true);
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
