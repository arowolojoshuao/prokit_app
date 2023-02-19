import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RcDashBoardScraan.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCPreferenceScreen extends StatefulWidget {
  String name;

  RCPreferenceScreen({required this.name});

  @override
  State<RCPreferenceScreen> createState() => _RCPreferenceScreenState();
}

class _RCPreferenceScreenState extends State<RCPreferenceScreen> {
  bool beef = false;
  bool salad = false;
  bool sandwich = false;
  bool spring = false;
  bool sushi = false;
  bool pizza = false;
  bool noodles = false;
  bool chinese = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.statusBarHeight + 16),
            Align(
              child: RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
              alignment: Alignment.topLeft,
            ).paddingAll(16),
            Text('Tell us what cuisines do you prefer', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily)).paddingSymmetric(horizontal: 16, vertical: 16),
            Text('Tap on what you like.', style: secondaryTextStyle(color: rcSecondaryTextColor)),
            20.height,
            Container(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    left: -20,
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(color: beef ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: beef ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageFour.png', height: 70),
                          10.height,
                          Text('Beef', style: secondaryTextStyle(color: beef ? primaryColor : rcSecondaryTextColor)),
                        ],
                      ),
                    ).onTap(() {
                      beef = !beef;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    top: 30,
                    left: 150,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: salad ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: salad ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        children: [
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/salad.png', height: 70),
                          Text(
                            'Salad',
                            style: secondaryTextStyle(color: salad ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      salad = !salad;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    top: 60,
                    right: -50,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: sandwich ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: sandwich ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageThree.png', height: 80),
                          Text(
                            'Sandwich',
                            style: secondaryTextStyle(color: sandwich ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      sandwich = !sandwich;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    top: 160,
                    left: -30,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          border: Border.all(color: spring ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: spring ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/soup.png', height: 70),
                          Text(
                            'Spring',
                            style: secondaryTextStyle(color: spring ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      spring = !spring;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    top: 130,
                    left: 90,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: sushi ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: sushi ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/sushi.png', height: 50),
                          Text(
                            'Sushi',
                            style: secondaryTextStyle(color: sushi ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      sushi = !sushi;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    bottom: 90,
                    right: 70,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: pizza ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: pizza ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/pizza.png', height: 50),
                          Text(
                            'Pizza',
                            style: secondaryTextStyle(color: pizza ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      pizza = !pizza;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 30,
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          border: Border.all(color: noodles ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: noodles ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageFive.png', height: 70),
                          Text(
                            'Noodles',
                            style: secondaryTextStyle(color: noodles ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      noodles = !noodles;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: chinese ? primaryColor : rcSecondaryColor.withAlpha(130)),
                          borderRadius: radius(100),
                          color: chinese ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
                      child: Column(
                        children: [
                          10.height,
                          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageThree.png', height: 60),
                          Text(
                            'Chinese',
                            style: secondaryTextStyle(color: chinese ? primaryColor : rcSecondaryTextColor),
                          ).center(),
                        ],
                      ),
                    ).onTap(() {
                      chinese = !chinese;
                      setState(() {});
                    }, borderRadius: radius(100)),
                  )
                ],
              ),
            ),
            10.height,
            Container(
                    child: Text('Continue', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                    width: context.width() - 40,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor))
                .onTap(() {
              RcDashBoardScraan(name: widget.name).launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
