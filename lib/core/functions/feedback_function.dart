import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soz_ucar/utils/colors.dart';

import '../../features/home/widgets/feed_back_widget.dart';

void feedbackDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0.r))),
        title: Text(
          'Geri Bildirim',
          style: TextStyle(color: ColorItems.primaryColor),
        ),
        content: const FeedbackForm(),
      );
    },
  );
}
