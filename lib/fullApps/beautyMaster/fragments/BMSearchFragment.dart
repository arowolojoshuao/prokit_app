import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMCommonCardComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMFloatingActionComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMSeacrFragmentHeaderComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMSearchListComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMSingleComponentScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMDataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class BMSearchFragment extends StatefulWidget {
  const BMSearchFragment({Key? key}) : super(key: key);

  @override
  State<BMSearchFragment> createState() => _BMSearchFragmentState();
}

class _BMSearchFragmentState extends State<BMSearchFragment> {
  List<String> searchTabList = ['ALL BUSINESS', 'BARBERSHOP', 'HAIR SALON', 'MASSAGE PARLOUR'];

  int selectedTab = 0;

  List<BMCommonCardModel> recommendedList = getRecommendedList();

  Widget getComponent() {
    if (selectedTab == 0) {
      return Column(
        children: recommendedList.map((e) {
          return GestureDetector(
              onTap: () {
                BMSingleComponentScreen(element: e).launch(context);
              },
              child: BMCommonCardComponent(fullScreenComponent: true, element: e, isFavList: false).paddingSymmetric(vertical: 10));
        }).toList(),
      );
    } else if (selectedTab == 1) {
      return Column(
        children: recommendedList.map((e) {
          return BMSearchListComponent(element: e).paddingSymmetric(vertical: 14);
        }).toList(),
      );
    } else if (selectedTab == 2) {
      return Column(
        children: recommendedList.map((e) {
          return BMCommonCardComponent(fullScreenComponent: true, element: e, isFavList: false).paddingSymmetric(vertical: 10);
        }).toList(),
      );
    } else {
      return Column(
        children: recommendedList.map((e) {
          return BMSearchListComponent(element: e).paddingSymmetric(vertical: 14);
        }).toList(),
      );
    }
  }

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraint) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BMSeacrFragmentHeaderComponent().paddingSymmetric(horizontal: 16, vertical: 16),
              Wrap(
                spacing: 16,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: radius(32),
                      border: Border.all(color: bmPrimaryColor, width: 2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.rotate(angle: 6, child: Icon(Icons.navigation_rounded, color: bmPrimaryColor)),
                        4.width,
                        Text('Your Current Location', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : bmSpecialColorDark, size: 12)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: radius(32),
                      border: Border.all(color: bmPrimaryColor, width: 2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today, color: bmPrimaryColor),
                        4.width,
                        Text('Anytime', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : bmSpecialColorDark, size: 12)),
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
              20.height,
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Container(
                  width: context.width(),
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? bmSecondBackgroundColorDark : bmSecondBackgroundColorLight,
                    borderRadius: radiusOnly(topLeft: 32, topRight: 32),
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HorizontalList(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          itemCount: searchTabList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: radius(32),
                                color: selectedTab == index ? bmPrimaryColor : Colors.transparent,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                searchTabList[index],
                                style: boldTextStyle(
                                  size: 12,
                                  color: selectedTab == index
                                      ? white
                                      : appStore.isDarkModeOn
                                          ? bmPrimaryColor
                                          : bmSpecialColorDark,
                                ),
                              ).onTap(() {
                                selectedTab = index;
                                setState(() {});
                              }),
                            );
                          },
                        ),
                        titleText(title: 'Show results', size: 16).paddingSymmetric(horizontal: 16),
                        getComponent().paddingSymmetric(horizontal: 16),
                        60.height,
                      ],
                    ).cornerRadiusWithClipRRectOnly(topRight: 32, topLeft: 32),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BMFloatingActionComponent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
