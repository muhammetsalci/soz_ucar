import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ozlu_sozler_flutter/core/base/view/base_widget.dart';
import 'package:ozlu_sozler_flutter/features/category/view-model/category_view_model.dart';
import 'package:ozlu_sozler_flutter/screens/quotes_screen.dart';
import 'package:ozlu_sozler_flutter/utils/colors.dart';
import 'package:ozlu_sozler_flutter/widgets/bannerAd_widget.dart';
import 'package:ozlu_sozler_flutter/widgets/custom_app_bar.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryViewModel>(
      viewModel: CategoryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CategoryViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  buildScaffoldBody(BuildContext context, CategoryViewModel viewModel) {
    return Observer(builder: (_) {
      return Scaffold(
        key: viewModel.scaffoldKey,
        backgroundColor: ColorItems.background,
        appBar: const CustomAppBar(),
        body: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : categoryListView(viewModel),
        bottomNavigationBar: BannerAdWidget(
          googleAds: viewModel.googleAds,
        ),
      );
    });
  }

  categoryListView(CategoryViewModel viewModel) {
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
        controller: viewModel.scrollController,
        itemCount: viewModel.numberOfCategories.length,
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
                child: categoryButton(context, viewModel,
                    viewModel.numberOfCategories[index], index)),
          );
        },
      ),
    );
  }

  categoryButton(BuildContext context, CategoryViewModel viewModel,
      String category, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: ColorItems.background),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuotesScreen(
                    items: viewModel.items,
                    selectedCategory: category,
                  )),
        );
        /* Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => QuotesScreen(
              items: viewModel.items,
              selectedCategory: category,
            ),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        ); */

        viewModel.selectedCategory = category;
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