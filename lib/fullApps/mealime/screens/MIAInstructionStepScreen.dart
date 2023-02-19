import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIAIngredientModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAConfirmQuitScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIABottomSheets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class MIAInstructionStepScreen extends StatefulWidget {
  const MIAInstructionStepScreen({Key? key}) : super(key: key);

  @override
  _MIAInstructionStepScreenState createState() => _MIAInstructionStepScreenState();
}

class _MIAInstructionStepScreenState extends State<MIAInstructionStepScreen> {
  List<MIAInstructionsModel> instructions = getInstructions();
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          40.height,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: context.height() - 200,
            width: context.width(),
            child: PageView(
              controller: pageController,
              children: instructions.map((e) {
                int pageIndex = instructions.indexOf(e) + 1;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pageIndex.toString(), style: boldTextStyle(size: 50)),
                      16.height,
                      Text(e.title, style: boldTextStyle(size: 30)),
                      16.height,
                      ...List.generate(
                          e.subtitles.length,
                          (index) => Row(
                                children: [
                                  Icon((Icons.circle), size: 10),
                                  8.width,
                                  Text(e.subtitles[index], style: boldTextStyle()),
                                ],
                              ).paddingSymmetric(vertical: 4)),
                      16.height,
                      pageIndex == 2
                          ? Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(color: miaContainerColor, borderRadius: radius(miaDefaultRadius)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('15 minutes', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.black : Colors.white)),
                                      8.width,
                                      Icon(Icons.arrow_right, color: appStore.isDarkModeOn ? Colors.black : Colors.white)
                                    ],
                                  ),
                                ).onTap(() {
                                  showTimerBottomSheet(context);
                                }),
                                16.width,
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(color: miaContainerColor, borderRadius: radius(miaDefaultRadius)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('5 minutes', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.black : Colors.white)),
                                      8.width,
                                      Icon(Icons.arrow_right, color: appStore.isDarkModeOn ? Colors.black : Colors.white)
                                    ],
                                  ),
                                ).onTap(() {
                                  showTimerBottomSheet(context);
                                })
                              ],
                            )
                          : Offstage(),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                );
              }).toList(),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          16.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(color: miaContainerSecondaryColor, borderRadius: radius(8)),
                child: Icon(Icons.view_list_rounded, color: miaSecondaryTextColor, size: 30),
              ),
              8.width,
              AppButton(
                color: miaPrimaryColor,
                text: 'Next',
                textStyle: boldTextStyle(color: white),
                onTap: () {
                  if (currentPage == 2) {
                    MIAConfirmQuitScreen().launch(context);
                  } else {
                    pageController.animateToPage(currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                  }
                },
              ).expand()
            ],
          ).paddingSymmetric(horizontal: 16),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < instructions.length; i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: 24,
                  decoration: BoxDecoration(
                    color: i == currentPage ? miaSecondaryTextColor : miaContainerSecondaryColor,
                    borderRadius: radius(12),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
