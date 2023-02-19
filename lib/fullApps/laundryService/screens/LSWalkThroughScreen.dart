import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSWalkThroughModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSSignInScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSContstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSWalkThroughScreen extends StatefulWidget {
  static String tag = '/laundry_service';

  @override
  LSWalkThroughScreenState createState() => LSWalkThroughScreenState();
}

class LSWalkThroughScreenState extends State<LSWalkThroughScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pageController.addListener(() {
      currentIndex = pageController.page.validate().toInt();
      setState(() {});
    });
    await 2.seconds.delay;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: context.height() * 0.89,
            child: PageView.builder(
                controller: pageController,
                itemCount: lsWalkThroughList.length,
                itemBuilder: (_, index) {
                  LSWalkThroughModel data = lsWalkThroughList[index];

                  return Stack(
                    children: [
                      commonCacheImageWidget(
                        data.backgroundImg.validate(),
                        context.height() * 0.82,
                        width: context.width(),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: appStore.isDarkModeOn ? Colors.transparent : white.withOpacity(0.5),
                        height: context.height(),
                        width: context.width(),
                      ),
                      Positioned(
                        top: context.height() * 0.14,
                        right: 0,
                        left: 0,
                        child: Column(
                          children: [
                            commonCacheImageWidget(data.img.validate(), 120, fit: BoxFit.cover),
                            20.height,
                            Text(data.title.validate(), style: boldTextStyle(size: 24)),
                            16.height,
                            Text(lsWalkSubTitle, style: secondaryTextStyle(), textAlign: TextAlign.center).paddingOnly(left: 8, right: 8),
                          ],
                        ).paddingOnly(left: 8, right: 8),
                      )
                    ],
                  );
                }),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DotIndicator(pageController: pageController, pages: lsWalkThroughList, indicatorColor: LSColorPrimary).center(),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              LSSignInScreen().launch(context);
            },
            child: Text('SKIP', style: boldTextStyle(color: LSColorPrimary)),
          ),
          Container(
            height: 50,
            width: currentIndex == 4 ? 90 : 50,
            color: LSColorPrimary,
            child: currentIndex == 4 ? Text('Start'.toUpperCase(), style: boldTextStyle(color: white)).center() : Icon(Icons.arrow_right_alt_rounded, color: white),
          ).cornerRadiusWithClipRRect(25).onTap(
            () {
              if (currentIndex == 4) LSSignInScreen().launch(context);
              pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
              setState(() {});
            },
            borderRadius: BorderRadius.circular(25),
          ).paddingRight(12),
        ],
      ).paddingBottom(8),
    );
  }
}
