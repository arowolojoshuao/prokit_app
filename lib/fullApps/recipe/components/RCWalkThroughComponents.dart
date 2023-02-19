import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';

class RCWalkThroughComponentOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          100.height,
          Text('Get Inspired', style: boldTextStyle(size: 24, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
          12.height,
          SizedBox(
            child: Text('Discover delicious recipes and funny food stories.', style: secondaryTextStyle(size: 16, color: rcSecondaryTextColor)),
            width: context.width() / 1.5,
          ),
          16.height,
          SizedBox(
            height: 500,
            width: context.width(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Image.asset('images/recipe/walkThroughImages/imageOne.jpg', height: 110, width: 110, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                ),
                SizedBox(
                  height: 230,
                  width: 230,
                  child: Stack(
                    children: [
                      Image.asset('images/recipe/walkThroughImages/imageTwo.jpg', height: 200, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: radius(100),
                          ),
                          child: Image.asset('images/recipe/coffee.jpg', height: 90, width: 90, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: Image.asset('images/recipe/panCake.jpg', height: 80, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                )
              ],
            ),
          )
        ],
      ).paddingOnly(left: 16),
    );
  }
}

class RCWalkThroughComponentTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        100.height,
        Text('Sharpen Your Skills', style: boldTextStyle(size: 24, fontFamily: GoogleFonts.playfairDisplay().fontFamily)).paddingOnly(left: 16),
        12.height,
        SizedBox(
          child: Text('With our Cooking Videos and top Tips.', style: secondaryTextStyle(size: 16, color: rcSecondaryTextColor)),
          width: context.width() / 1.5,
        ).paddingOnly(left: 16),
        SizedBox(
          height: 450,
          width: context.width(),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: -60,
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(30 / 360),
                  child: Image.asset('images/recipe/walkThroughImages/imageFive.png', width: 220, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -2,
                child: Image.asset('images/recipe/walkThroughImages/imageThree.png', height: 200, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
              ),
              Positioned(
                right: -8,
                child: Image.asset('images/recipe/walkThroughImages/imageFour.png', width: 180, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RCWalkThroughComponentThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('images/recipe/burger.jpg', width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
        30.height,
        Text('Shape Your Recipes', style: boldTextStyle(size: 24, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
        12.height,
        SizedBox(child: Text('With our international community.', style: secondaryTextStyle(size: 16, color: rcSecondaryTextColor)), width: context.width() / 1.5),
        50.height,
        Container(
          child: Text('Get Started', style: boldTextStyle(size: 18, color: Colors.white)).center(),
          width: context.width() - 40,
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
        ).onTap(() {
          RCSignUpScreen(selectedIndex: 0).launch(context);
        }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
        50.height
      ],
    ).paddingOnly(left: 16);
  }
}
