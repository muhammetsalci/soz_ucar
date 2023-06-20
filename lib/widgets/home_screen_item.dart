import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ozlu_sozler_flutter/uitils/colors.dart';
import 'package:toast/toast.dart';

class HomeScreenItem extends StatelessWidget {
  HomeScreenItem(
      {Key? key,
      this.page,
      //required this.onTap,
      required this.text,
      required this.lottie,
      //required this.icon,
      this.textColor,
      this.color})
      : super(key: key);
  //final VoidCallback onTap;
  final String lottie;
  final String text;
  //final IconData icon;
  final page;
  Color? textColor;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        height: 120.h,
        width: 330.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(60 / 2)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 60 / 5,
              offset: const Offset(0, 60 / 5),
            ),
          ],
        ),
        child: MaterialButton(
            //padding: const EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: ColorItems.secondaryColor,
            onPressed: () {
              if (page == null) {
                Toast.show("Yakında...");
              } else {
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                ); */
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => page,
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              }
            },
            child: Row(
              children: <Widget>[
                /* Icon(
                  icon,
                  color: color ?? ColorItems.primaryColor,
                  size: 80.w,
                ), */
                Lottie.network(
                  lottie,
                  width: 100.w,
                  height: 100.h,
                  repeat: false
                  //animate: false,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: textColor ?? ColorItems.textColor),
                  ),
                ),
                /* Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: ColorItems.textColor.withOpacity(0.05),
                        //blurRadius: 25 / 5,
                        offset: const Offset(0, 5 / 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    child: Icon(
                      Icons.arrow_forward,
                      color: /* color ??  */ ColorItems.textColor,
                    ),
                  ),
                ), */
              ],
            )),
      ),
    );
  }
}
