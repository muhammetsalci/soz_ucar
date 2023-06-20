import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ozlu_sozler_flutter/uitils/colors.dart';

import '../uitils/strings.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorizeColors = [ColorItems.textColor, ColorItems.primaryColor];

    const colorizeTextStyle = TextStyle(
        fontSize: 33.0, fontFamily: 'Horizon', fontWeight: FontWeight.bold);
    return SizedBox(
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            StringItems.appName,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
        repeatForever: true,
        pause: const Duration(milliseconds: 5000),
      ),
    );
  }
}
