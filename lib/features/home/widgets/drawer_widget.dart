import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soz_ucar/core/widgets/app_name.widget.dart';
import '../../../core/functions/feedback_function.dart';
import '../../../utils/colors.dart';

class DrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: ColorItems.primaryColor,
              ),
              child: Center(
                  child: AppNameWidget(
                customColor: ColorItems.background,
              ))),
          Card(
            child: ListTile(
              iconColor: ColorItems.primaryColor,
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Geri Bildirim'),
              onTap: () {
                //bottomSheet(context);
                feedbackDialog(context);
                scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ),
          Card(
            child: ListTile(
              iconColor: ColorItems.primaryColor,
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Çıkış'),
              onTap: () {
                _exitShowDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

/*   Future<dynamic> bottomSheet(BuildContext context) {
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
  } */



  void _exitShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: ListTile(
              title: SvgPicture.asset(
                'assets/logo.svg',
                // ignore: deprecated_member_use
                color: ColorItems.primaryColor,
                width: MediaQuery.of(context).size.width / 8.52,
                height: MediaQuery.of(context).size.height / 16.2,
              ),
              //title: Text(StringItems.appName),
            ),
            content: const Text(
              'Çıkış yapmak istediğinize emin misiniz?',
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('HAYIR'),
              ),
              MaterialButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text('EVET'),
              )
            ],
          );
        });
  }
}
