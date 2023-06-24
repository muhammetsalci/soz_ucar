import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import '../features/home/widgets/feed_back_widget.dart';

class DrawerWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: ColorItems.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundImage: const AssetImage("assets/logo6.png"),
                      backgroundColor: ColorItems.secondaryColor,
                      radius: 50.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      StringItems.appName,
                      style: TextStyle(
                        color: ColorItems.secondaryColor,
                        fontSize: 20.sp,
                      ),
                    ),
                  )
                ],
              )),
          Card(
            child: ListTile(
              iconColor: ColorItems.primaryColor,
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Geri Bildirim'),
              onTap: () {
                bottomSheet(context);
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

  void _exitShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/logo.png"),
                backgroundColor: Colors.transparent,
              ),
              title: Text(StringItems.appName),
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
