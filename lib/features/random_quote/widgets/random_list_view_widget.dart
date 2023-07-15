import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soz_ucar/features/random_quote/model/random_quote_model.dart';

import 'package:soz_ucar/utils/colors.dart';

class RandomListView extends StatelessWidget {
  final List<RandomQuoteReSponseModel>? items;
  final int randomNumber;
  const RandomListView({
    Key? key,
    required this.items,
    required this.randomNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int randomNumber = Random().nextInt(items!.length);
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 8.0.h),
      child: Container(
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(60 / 2)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorItems.shadowColor,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: ColorItems.secondaryColor,
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                Center(
                  child: Text(
                    items?[randomNumber].userId.toString() ?? '',
                    style: TextStyle(
                        color: ColorItems.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                Divider(
                  height: 10.h,
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Text(
                    items![randomNumber].sentence.toString(),
                    style:
                        TextStyle(color: ColorItems.textColor, fontSize: 20.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
