import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/components/MealTabComponents.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAMealModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAGuideScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIABottomSheets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MIASingleMealScreen extends StatefulWidget {
  MIAMealModel element;

  MIASingleMealScreen({required this.element});

  @override
  State<MIASingleMealScreen> createState() => _MIASingleMealScreenState();
}

class _MIASingleMealScreenState extends State<MIASingleMealScreen> {
  bool fav = false;

  @override
  void initState() {
    changeStatusColor(Colors.transparent);
    super.initState();
  }

  @override
  void dispose() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: miaPrimaryColor),
                  onPressed: () {
                    finish(context);
                  },
                ),
                leadingWidth: 30,
                actions: [
                  IconButton(
                    icon: Icon(Icons.more_horiz, size: 40, color: miaPrimaryColor),
                    onPressed: () {
                      showActionMenuBottomSheet(context);
                    },
                  ),
                  16.width,
                ],
                pinned: true,
                elevation: 0.5,
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 66, left: 30, right: 50),
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    widget.element.text,
                    style: boldTextStyle(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ).visible(innerBoxIsScrolled),
                  background: Column(
                    children: [
                      Stack(
                        children: [
                          miaCommonCachedNetworkImage(
                            widget.element.image,
                            height: 300,
                            width: context.width(),
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: 300,
                            width: context.width(),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.3),
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.0),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                            ])),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.element.text, style: boldTextStyle(size: 24)).expand(),
                                IconButton(
                                  icon: fav ? Icon(Icons.favorite_rounded, color: Colors.red, size: 30) : Icon(Icons.favorite_border, size: 30),
                                  onPressed: () {
                                    fav = !fav;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            24.height,
                            Row(
                              children: [
                                Text('35 minutes  ', style: primaryTextStyle(color: miaSecondaryTextColor)),
                                Icon(Icons.circle, color: miaSecondaryTextColor, size: 10),
                                Text('  2 servings  ', style: primaryTextStyle(color: miaSecondaryTextColor)),
                              ],
                            ),
                            16.height,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  labelStyle: boldTextStyle(),
                  indicator: BoxDecoration(color: miaPrimaryColor, borderRadius: radiusOnly(topRight: 6, topLeft: 6)),
                  indicatorColor: miaPrimaryColor,
                  unselectedLabelColor: miaPrimaryColor,
                  tabs: [
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Cookware'),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Ingredients'),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Instructions'),
                      ),
                    )
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              cookwareTab(),
              ingredientsTab(),
              instructionsTab(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: boxDecorationDefault(borderRadius: radius(0), color: context.cardColor),
        child: Row(
          children: [
            AppButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: miaSecondaryColor),
                  4.width,
                  Text('Cooked?', style: boldTextStyle(color: miaSecondaryColor)),
                ],
              ),
              color: miaContainerSecondaryColor,
              onTap: () {
                //
              },
            ),
            16.width,
            AppButton(
              color: miaPrimaryColor,
              text: 'Start Cooking',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                MIAGuideScreen().launch(context);
              },
            ).expand()
          ],
        ),
      ),
    );
  }
}
