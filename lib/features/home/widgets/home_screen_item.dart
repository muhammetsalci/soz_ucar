import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:soz_ucar/utils/colors.dart';

import 'feed_back_widget.dart';

class HomeScreenItem extends StatelessWidget {
  const HomeScreenItem(
      {Key? key,
      required this.position,
      this.page,
      required this.text,
      this.lottieAsset,
      this.lottieURL,
      this.textColor,
      this.color})
      : super(key: key);
  final String? lottieURL;
  final String position;
  final String? lottieAsset;
  final String text;
  final dynamic page;
  final Color? textColor;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    String lottieA = "assets/lottie/$lottieAsset";
    String lottieU = lottieURL ??
        "https://assets5.lottiefiles.com/packages/lf20_cr0kgqaq.json";
    ShapeBorder? customShape;
    if (position == 'topLeft') {
      customShape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15)));
    } else if (position == 'topRight') {
      customShape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15)));
    } else if (position == 'bottomLeft') {
      customShape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)));
    } else if (position == 'bottomRight') {
      customShape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)));
    }
    return Container(
      height: 80.h,
      width: MediaQuery.of(context).size.width / 2 - 15,
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      child: MaterialButton(
          //padding: const EdgeInsets.all(20),
          shape: customShape,
          color: ColorItems.primaryColor,
          onPressed: () {
            if (page == null && text != 'Geri Bildirim') {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: ColorItems.primaryColor,
                  content: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.clock,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Yakında",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )));
            } else if (text == 'Geri Bildirim') {
              bottomSheet(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorItems.background,
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: lottieAsset != null
                      ? Lottie.asset(lottieA,
                          width: 50.w, height: 50.h, repeat: false
                          //animate: false,
                          )
                      : Lottie.network(lottieU,
                          width: 50.w, height: 50.h, repeat: false
                          //animate: false,
                          ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0.w),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: textColor ?? ColorItems.background,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.0.h),
            child: const FeedbackForm(),
          ),
        );
      },
    );
  }
}
