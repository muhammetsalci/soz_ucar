// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:soz_ucar/utils/colors.dart';
import 'package:soz_ucar/core/widgets/app_name.widget.dart';

class CustomAppbar extends StatelessWidget {
  final Icon customIcon;
  final VoidCallback customOnPressed;
  const CustomAppbar({
    Key? key,
    required this.customIcon,
    required this.customOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            color: ColorItems.secondaryColor,
            elevation: 5,
            child: IconButton(
              color: ColorItems.primaryColor,
              icon: customIcon,
              onPressed: customOnPressed,
              //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          AppNameWidget(),
          const TextButton(onPressed: null, child: Text(''))
        ],
      ),
    );
  }
}
