// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ozlu_sozler_flutter/utils/colors.dart';

// ignore: must_be_immutable
class AppNameWidget extends StatelessWidget {
  Color? customColor;
  AppNameWidget({
    Key? key,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SvgPicture.asset(
      'assets/logo.svg',
      // ignore: deprecated_member_use
      color: customColor ?? ColorItems.primaryColor,
      width: screenWidth / 8.52,
      height: screenHeight / 16.2,
    );
  }
}
