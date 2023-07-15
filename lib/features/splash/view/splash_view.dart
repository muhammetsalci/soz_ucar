import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ozlu_sozler_flutter/core/base/view/base_widget.dart';
import 'package:ozlu_sozler_flutter/features/splash/view-model/splash_view_model.dart';
import 'package:ozlu_sozler_flutter/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              ColorItems.secondaryColor,
              ColorItems.primaryColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
              // ignore: deprecated_member_use
              color: ColorItems.background,
             height: 100.h,
              width: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
