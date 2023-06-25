import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ozlu_sozler_flutter/features/category/model/category_model.dart';

import 'package:ozlu_sozler_flutter/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class MainListView extends StatelessWidget {
  final List<CategoryModel>? items;
  final String selectedCategory;
  const MainListView({
    Key? key,
    required this.items,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri twitterUrl;
    String? soz;
    return ListView.builder(
      itemCount: items?.length,
      itemBuilder: (BuildContext context, int index) {
        if (items?[index].userId == selectedCategory) {
          return Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 8.0.h),
            child: Container(
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: ColorItems.secondaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorItems.primaryColor,
                            child: FaIcon(
                              FontAwesomeIcons.quoteRight,
                              color: ColorItems.secondaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0.h),
                            child: SizedBox(
                              width: 250.w,
                              child: Text(
                                "${items?[index].sentence}\n\n${items?[index].author}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: ColorItems.textColor),
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: ColorItems.primaryColor,
                            thickness: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  soz = items?[index].sentence.toString();
                                  twitterUrl = Uri.parse(
                                      'https://twitter.com/intent/tweet?text=${soz!}');
                                  launchUrl(
                                    twitterUrl,
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: ColorItems.primaryColor,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    soz = items?[index].sentence.toString();

                                    Clipboard.setData(
                                            ClipboardData(text: soz.toString()))
                                        .then(
                                      (value) => ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  ColorItems.primaryColor,
                                              content: const Row(
                                                children: [
                                                  Icon(
                                                    Icons.copy,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Panoya Kopyalandı",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ))),
                                    );
                                  },
                                  child: Icon(
                                    Icons.copy,
                                    color: ColorItems.primaryColor,
                                  )),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
