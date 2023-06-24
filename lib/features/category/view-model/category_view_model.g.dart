// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryViewModel on _CategoryViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_CategoryViewModelBase.items', context: context);

  @override
  List<CategoryModel>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<CategoryModel>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$categoryServiceAtom =
      Atom(name: '_CategoryViewModelBase.categoryService', context: context);

  @override
  CategoryService get categoryService {
    _$categoryServiceAtom.reportRead();
    return super.categoryService;
  }

  @override
  set categoryService(CategoryService value) {
    _$categoryServiceAtom.reportWrite(value, super.categoryService, () {
      super.categoryService = value;
    });
  }

  late final _$numberOfCategoriesAtom =
      Atom(name: '_CategoryViewModelBase.numberOfCategories', context: context);

  @override
  List<dynamic> get numberOfCategories {
    _$numberOfCategoriesAtom.reportRead();
    return super.numberOfCategories;
  }

  @override
  set numberOfCategories(List<dynamic> value) {
    _$numberOfCategoriesAtom.reportWrite(value, super.numberOfCategories, () {
      super.numberOfCategories = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_CategoryViewModelBase.selectedCategory', context: context);

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CategoryViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchPostItemsAdvanceAsyncAction = AsyncAction(
      '_CategoryViewModelBase.fetchPostItemsAdvance',
      context: context);

  @override
  Future fetchPostItemsAdvance() {
    return _$fetchPostItemsAdvanceAsyncAction
        .run(() => super.fetchPostItemsAdvance());
  }

  late final _$_CategoryViewModelBaseActionController =
      ActionController(name: '_CategoryViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_CategoryViewModelBaseActionController.startAction(
        name: '_CategoryViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CategoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void apiShowDialog(Object message) {
    final _$actionInfo = _$_CategoryViewModelBaseActionController.startAction(
        name: '_CategoryViewModelBase.apiShowDialog');
    try {
      return super.apiShowDialog(message);
    } finally {
      _$_CategoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
categoryService: ${categoryService},
numberOfCategories: ${numberOfCategories},
selectedCategory: ${selectedCategory},
isLoading: ${isLoading}
    ''';
  }
}
