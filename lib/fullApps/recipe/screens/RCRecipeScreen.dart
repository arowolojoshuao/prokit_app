import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCCircularWrapComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCReviewComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCVideoListComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCCollectionModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCHomeStoryModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCSearchModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCVideoModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCReviewScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCBottomSheet.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCRecipeScreen extends StatefulWidget {
  RCHomeStoryModel element;
  List<RCCollectionModel> collectionList;

  RCRecipeScreen({required this.element, required this.collectionList});

  @override
  State<RCRecipeScreen> createState() => _RCRecipeScreenState();
}

class _RCRecipeScreenState extends State<RCRecipeScreen> {
  bool liked = false;

  List<RCSearchModel> ingredientList = [];

  List<RCVideoModel> videoList = getvideoList();

  @override
  void initState() {
    ingredientList.add(RCSearchModel(name: '9 oz', image: '$BaseUrl/images/recipe/walkThroughImages/imageFive.png'));
    ingredientList.add(RCSearchModel(name: '7 oz', image: '$BaseUrl/images/recipe/walkThroughImages/imageFour.png'));
    ingredientList.add(RCSearchModel(name: '2 cups', image: '$BaseUrl/images/recipe/walkThroughImages/imageThree.png'));
    ingredientList.add(RCSearchModel(name: '2 clovest', image: '$BaseUrl/images/recipe/walkThroughImages/imageFive.png'));
    ingredientList.add(RCSearchModel(name: '2 cloves', image: '$BaseUrl/images/recipe/walkThroughImages/imageFour.png'));

    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? Colors.black : Colors.white);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.statusBarHeight + 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          icon: liked ? Icon(LineIcons.heart_1, color: Colors.red) : Icon(LineIcons.heart, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                          onPressed: () {
                            liked = !liked;
                            setState(() {});
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          icon: Icon(LineIcons.bookmark, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                          onPressed: () {
                            showSaveBottomSheet(context, widget.collectionList);
                          },
                        )),
                    Container(
                        decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                        margin: EdgeInsets.all(6),
                        child: IconButton(
                          icon: Icon(Icons.share, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                          onPressed: () {
                            showShareBottomSheet(context);
                          },
                        ))
                  ],
                )
              ],
            ).paddingAll(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rcCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageThree.png', height: 120),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Spaghetti', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 26)),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(5, (index) {
                          if (index == 4) {
                            return Icon(LineIcons.star_1, color: rcSecondaryColor, size: 20);
                          }
                          return Icon(
                            LineIcons.star_1,
                            color: primaryColor,
                            size: 20,
                          );
                        }),
                        8.width,
                        Text('(729 ratings)', style: secondaryTextStyle())
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        rcProfileImage(widget.element.img, 40, 40),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.element.name, style: boldTextStyle(color: primaryColor, size: 18)),
                            Text(widget.element.subTitle, style: primaryTextStyle(color: rcSecondaryTextColor, size: 14)),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ).paddingAll(16),
            8.height,
            RCCircularWrapComponent().paddingOnly(left: 16),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Reviews', style: boldTextStyle(size: 20)),
                Text('More', style: boldTextStyle(color: primaryColor, size: 20)).onTap(() {
                  RCReviewScreen().launch(context);
                }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              ],
            ).paddingAll(16),
            RCReviewComponent().onTap(() {
              RCReviewScreen().launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ingredients', style: boldTextStyle(size: 20)),
                Text('More', style: boldTextStyle(color: primaryColor, size: 20)),
              ],
            ).paddingAll(16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ingredientList.map((e) {
                return Container(
                  width: context.width() / 3 - 16,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: radius(16),
                    color: appStore.isDarkModeOn ? rcSecondaryTextColor : rcSecondaryColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      rcCommonCachedNetworkImage(e.image, height: 70),
                      8.height,
                      Text(e.name, style: secondaryTextStyle()),
                    ],
                  ),
                );
              }).toList(),
            ).paddingAll(16),
            Container(
              child: Text('Add to shopping list', style: boldTextStyle(size: 18, color: Colors.white)).center(),
              width: context.width() - 40,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
            ),
            Text('How to video', style: boldTextStyle(size: 20)).paddingAll(16),
            HorizontalList(
              itemCount: videoList.length,
              itemBuilder: (context, index) {
                return RCVideoListComponent(videoList[index]);
              },
            ),
            16.height,
            Text('Utensils', style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
            16.height,
            Text('Cutting board, knief, cooking spoon, deep pan, 2 pasta tongs', style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Steps', style: boldTextStyle(size: 20)),
                Text('See all', style: boldTextStyle(color: primaryColor, size: 20)),
              ],
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Row(
              children: [
                Text('01', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30, color: primaryColor)),
                16.width,
                Text(
                  'Clean spanish. Cut onion into thin strips, finely chop garlic, and halve cherry tomatoes.',
                  style: secondaryTextStyle(),
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Row(
              children: [
                Text('02', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30, color: primaryColor)),
                16.width,
                Text(
                  'Clean spanish. Cut onion into thin strips, finely chop garlic, and halve cherry tomatoes.',
                  style: secondaryTextStyle(),
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Row(
              children: [
                Text('03', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30, color: primaryColor)),
                16.width,
                Text(
                  'Clean spanish. Cut onion into thin strips, finely chop garlic, and halve cherry tomatoes.',
                  style: secondaryTextStyle(),
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Row(
              children: [
                Text('04', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30, color: primaryColor)),
                16.width,
                Text(
                  'Clean spanish. Cut onion into thin strips, finely chop garlic, and halve cherry tomatoes.',
                  style: secondaryTextStyle(),
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16),
            100.height,
          ],
        ),
      ),
      floatingActionButton: Container(
        child: Text('Start Cooking', style: boldTextStyle(size: 18, color: Colors.white)).center(),
        width: context.width() - 60,
        height: 50,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
      ),
    );
  }
}
