import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMCommonCardComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMHomeFragmentHeadComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMMyMasterComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMTopServiceHomeComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMRecommendedScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMTopOffersScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMDataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class BMHomeFragment extends StatefulWidget {
  const BMHomeFragment({Key? key}) : super(key: key);

  @override
  State<BMHomeFragment> createState() => _BMHomeFragmentState();
}

class _BMHomeFragmentState extends State<BMHomeFragment> {
  List<BMCommonCardModel> specialOffersList = getSpecialOffersList();

  List<BMCommonCardModel> recommendedList = getRecommendedList();

  @override
  void initState() {
    setStatusBarColor(bmSpecialColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeFragmentHeadComponent(),
            lowerContainer(
              screenContext: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  titleText(title: 'My Master').paddingSymmetric(horizontal: 16),
                  20.height,
                  BMMyMasterComponent(),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Top Services'),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              BMTopOffersScreen().launch(context);
                            },
                            child: Text('See All', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : bmTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios, color: appStore.isDarkModeOn ? bmPrimaryColor : bmTextColorDarkMode, size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  BMTopServiceHomeComponent(),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Special Offers'),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              BMTopOffersScreen().launch(context);
                            },
                            child: Text('See All', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : bmTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios, color: appStore.isDarkModeOn ? bmPrimaryColor : bmTextColorDarkMode, size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  HorizontalList(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: specialOffersList.length,
                    itemBuilder: (context, index) {
                      return BMCommonCardComponent(element: specialOffersList[index], fullScreenComponent: false, isFavList: false);
                    },
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText(title: 'Recommended for You').expand(),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              BMRecommendedScreen().launch(context);
                            },
                            child: Text('See All', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : bmTextColorDarkMode)),
                          ),
                          Icon(Icons.arrow_forward_ios, color: appStore.isDarkModeOn ? bmPrimaryColor : bmTextColorDarkMode, size: 16),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  20.height,
                  HorizontalList(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    spacing: 16,
                    itemCount: recommendedList.length,
                    itemBuilder: (context, index) {
                      return BMCommonCardComponent(element: recommendedList[index], fullScreenComponent: false, isFavList: false);
                    },
                  ),
                  40.height,
                ],
              ).cornerRadiusWithClipRRectOnly(topRight: 40),
            ),
          ],
        ),
      ),
    );
  }
}
