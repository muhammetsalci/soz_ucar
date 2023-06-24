import 'package:flutter/material.dart';
import 'package:ozlu_sozler_flutter/utils/colors.dart';
import 'package:ozlu_sozler_flutter/utils/strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorItems.primaryColor,
      title: Text(StringItems.appName),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
