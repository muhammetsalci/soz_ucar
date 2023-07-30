import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:soz_ucar/features/home/view/home_view.dart';
import '../../../core/base/model/base_view_model.dart';
part 'splash_view_model.g.dart';

// ignore: library_private_types_in_public_api
class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase extends BaseViewModel with Store {
  @override
  void init() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(viewContext!,
          MaterialPageRoute(builder: (context) => const HomeView()));
    });
  }

  @override
  void setContext(BuildContext context) {
    viewContext = context;
  }
}
