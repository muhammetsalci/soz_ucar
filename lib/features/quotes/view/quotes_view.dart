// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:soz_ucar/core/base/view/base_widget.dart';
import 'package:soz_ucar/features/category/model/category_model.dart';
import 'package:soz_ucar/features/quotes/view-model/quotes_view_model.dart';
import 'package:soz_ucar/utils/colors.dart';
import 'package:soz_ucar/core/widgets/bannerAd_widget.dart';
import 'package:soz_ucar/core/widgets/custom_appbar.dart';
import 'package:soz_ucar/core/widgets/main_list_view_widget.dart';

class QuotesView extends StatelessWidget {
  final List<CategoryModel>? items;
  final String selectedCategory;
  const QuotesView({
    Key? key,
    required this.items,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<QuotesViewModel>(
      viewModel: QuotesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, QuotesViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  buildScaffoldBody(BuildContext context, QuotesViewModel viewModel) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      backgroundColor: ColorItems.background,
      //appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              customOnPressed: () {
                Navigator.pop(context);
              },
              customIcon: const Icon(Icons.arrow_back_ios_new),
            ),
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
                  color: ColorItems.secondaryColor,
                  child: Center(
                    child: Text(
                      selectedCategory,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: ColorItems.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: MainListView(
                    items: items, selectedCategory: selectedCategory)),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdWidget(
        googleAds: viewModel.googleAds,
      ),
    );
  }
}
