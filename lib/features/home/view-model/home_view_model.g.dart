// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$bannerAdAtom =
      Atom(name: '_HomeViewModelBase.bannerAd', context: context);

  @override
  BannerAd get bannerAd {
    _$bannerAdAtom.reportRead();
    return super.bannerAd;
  }

  @override
  set bannerAd(BannerAd value) {
    _$bannerAdAtom.reportWrite(value, super.bannerAd, () {
      super.bannerAd = value;
    });
  }

  late final _$isAdLoadedAtom =
      Atom(name: '_HomeViewModelBase.isAdLoaded', context: context);

  @override
  bool get isAdLoaded {
    _$isAdLoadedAtom.reportRead();
    return super.isAdLoaded;
  }

  @override
  set isAdLoaded(bool value) {
    _$isAdLoadedAtom.reportWrite(value, super.isAdLoaded, () {
      super.isAdLoaded = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic initBannerAd() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.initBannerAd');
    try {
      return super.initBannerAd();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bannerAd: ${bannerAd},
isAdLoaded: ${isAdLoaded}
    ''';
  }
}
