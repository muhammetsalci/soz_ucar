import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ozlu_sozler_flutter/features/category/model/category_model.dart';

import 'package:ozlu_sozler_flutter/utils/colors.dart';
import 'package:toast/toast.dart';
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
                  child: /* ListTile(
                    isThreeLine: true,
                    /* title: Text(
                      selectedCategory,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorItems.primaryColor),
                    ), */
                    leading: CircleAvatar(
                      backgroundColor: ColorItems.primaryColor,
                      child: /* Text(
                        items?[index].sentenceId.toString() ?? '',
                        style: TextStyle(color: ColorItems.secondaryColor),
                      ), */
                      FaIcon(
                        FontAwesomeIcons.quoteRight,
                        color: ColorItems.secondaryColor,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: Text(
                        "${items?[index].sentence}\n\n${items?[index].author}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorItems.textColor),
                      ),
                    ),
                    trailing: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            String? soz = items?[index].sentence.toString();
                            url = Uri.parse(
                                'https://twitter.com/intent/tweet?text=${soz!}');
                            launchUrl(
                              url,
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
                          onTap: () {},
                          child: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: ColorItems.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ), */
                      IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /* title: Text(
                        selectedCategory,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorItems.primaryColor),
                      ), */
                          CircleAvatar(
                            backgroundColor: ColorItems.primaryColor,
                            child: /* Text(
                          items?[index].sentenceId.toString() ?? '',
                          style: TextStyle(color: ColorItems.secondaryColor),
                        ), */
                                FaIcon(
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
                                  /* launchUrl(
                                    whatsappUrl,
                                    mode: LaunchMode.externalApplication,
                                  ); */
                                  Clipboard.setData(
                                          ClipboardData(text: soz.toString()))
                                      .then((value) =>
                                          Toast.show("Panoya Kopyalandı",gravity: Toast.center,
                                          duration: 2,
                                          ));
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.copy,
                                  color: ColorItems.primaryColor,
                                ),
                              ),
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
