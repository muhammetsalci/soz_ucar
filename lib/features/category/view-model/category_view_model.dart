import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:soz_ucar/features/category/model/category_model.dart';
import 'package:soz_ucar/features/category/service/category_service.dart';
import 'package:soz_ucar/core/base/model/base_view_model.dart';
import 'package:soz_ucar/services/google_ads.dart';
part 'category_view_model.g.dart';

// ignore: library_private_types_in_public_api
class CategoryViewModel = _CategoryViewModelBase with _$CategoryViewModel;

abstract class _CategoryViewModelBase extends BaseViewModel with Store {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final GoogleAds googleAds = GoogleAds();

  @override
  void init() {
    categoryService = CategoryService();
    fetchPostItemsAdvance();
    googleAds.loadIntersititalAd();
    googleAds.loadBannerAd();
  }

  @override
  void setContext(BuildContext context) {
    viewContext = context;
  }

  @observable
  List<CategoryModel>? items;
  @observable
  CategoryService categoryService = CategoryService();
  @observable
  List numberOfCategories = [];
  @observable
  String selectedCategory = '';
  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  fetchPostItemsAdvance() async {
    changeLoading();
    items = await categoryService.fetchPostItemsAdvance();
    if (items != null) {
      for (var item in items!) {
        numberOfCategories.add(item.userId);
      }
      numberOfCategories = numberOfCategories.toSet().toList();
      debugPrint("kategori sayısı: ${numberOfCategories.length}");
    } else {
      apiShowDialog(categoryService.message);
    }

    changeLoading();
  }

  @action
  void apiShowDialog(Object message) {
    showDialog(
        context: viewContext!,
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
}
