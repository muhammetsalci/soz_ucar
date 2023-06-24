// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_quote_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RandomQuoteViewModel on _RandomQuoteViewModelBase, Store {
  late final _$itemsAtom =
      Atom(name: '_RandomQuoteViewModelBase.items', context: context);

  @override
  List<RandomQuoteReSponseModel>? get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<RandomQuoteReSponseModel>? value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$randomQuoteServiceAtom = Atom(
      name: '_RandomQuoteViewModelBase.randomQuoteService', context: context);

  @override
  RandomQuoteService get randomQuoteService {
    _$randomQuoteServiceAtom.reportRead();
    return super.randomQuoteService;
  }

  @override
  set randomQuoteService(RandomQuoteService value) {
    _$randomQuoteServiceAtom.reportWrite(value, super.randomQuoteService, () {
      super.randomQuoteService = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_RandomQuoteViewModelBase.isLoading', context: context);

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

  late final _$numberAtom =
      Atom(name: '_RandomQuoteViewModelBase.number', context: context);

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$isApiCallProcessAtom = Atom(
      name: '_RandomQuoteViewModelBase.isApiCallProcess', context: context);

  @override
  bool get isApiCallProcess {
    _$isApiCallProcessAtom.reportRead();
    return super.isApiCallProcess;
  }

  @override
  set isApiCallProcess(bool value) {
    _$isApiCallProcessAtom.reportWrite(value, super.isApiCallProcess, () {
      super.isApiCallProcess = value;
    });
  }

  late final _$fetchPostItemsAdvanceAsyncAction = AsyncAction(
      '_RandomQuoteViewModelBase.fetchPostItemsAdvance',
      context: context);

  @override
  Future fetchPostItemsAdvance() {
    return _$fetchPostItemsAdvanceAsyncAction
        .run(() => super.fetchPostItemsAdvance());
  }

  late final _$_RandomQuoteViewModelBaseActionController =
      ActionController(name: '_RandomQuoteViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_RandomQuoteViewModelBaseActionController
        .startAction(name: '_RandomQuoteViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_RandomQuoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void apiShowDialog(Object message) {
    final _$actionInfo = _$_RandomQuoteViewModelBaseActionController
        .startAction(name: '_RandomQuoteViewModelBase.apiShowDialog');
    try {
      return super.apiShowDialog(message);
    } finally {
      _$_RandomQuoteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
randomQuoteService: ${randomQuoteService},
isLoading: ${isLoading},
number: ${number},
isApiCallProcess: ${isApiCallProcess}
    ''';
  }
}
