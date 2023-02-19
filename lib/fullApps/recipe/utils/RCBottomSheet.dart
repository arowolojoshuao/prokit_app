import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCCollectionComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCSortComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCCollectionModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCShareNameModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCSortModel.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCVideoModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCVideoPlayerScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

List<RCShareNameModel> shareNameList = getShareNameList();

List<RCSortModel> sortList = getSortList();

void showSaveBottomSheet(BuildContext context, List<RCCollectionModel> collectionList) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Save Article', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30)),
            8.height,
            Text('Add this post to a collection', style: secondaryTextStyle(color: rcSecondaryTextColor)),
            16.height,
            Wrap(
              runSpacing: 12,
              children: collectionList.map((e) {
                return RCCollectionComponent(e: e);
              }).toList(),
            ),
            20.height,
            Row(
              children: [
                Container(
                  child: Text('Create New', style: boldTextStyle(size: 18, color: primaryColor)).center(),
                  width: context.width() / 2 - 32,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(borderRadius: radius(32), border: Border.all(color: primaryColor)),
                ).onTap(() {
                  finish(context);
                  showCreateBottomSheet(context, collectionList);
                }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                16.width,
                Container(
                  child: Text('Done', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                  width: context.width() / 2 - 32,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
                ).onTap(() {
                  finish(context);
                }, splashColor: Colors.transparent, highlightColor: Colors.transparent)
              ],
            ),
            20.height,
          ],
        ).paddingAll(16);
      });
}

void showCreateBottomSheet(BuildContext context, List<RCCollectionModel> collectionList) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Create A Cookbook', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30)),
            16.height,
            Row(
              children: [
                Icon(Icons.info_outlined, color: rcSecondaryTextColor),
                8.width,
                Text('Title', style: secondaryTextStyle(color: rcSecondaryTextColor)),
              ],
            ),
            AppTextField(
              textFieldType: TextFieldType.NAME,
              textStyle: boldTextStyle(),
              decoration: InputDecoration(
                hintText: 'Enter title',
                hintStyle: secondaryTextStyle(),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: rcSecondaryTextColor)),
              ),
            ),
            16.height,
            Row(
              children: [
                Icon(Icons.info_outlined, color: rcSecondaryTextColor),
                8.width,
                Text('Description', style: secondaryTextStyle(color: rcSecondaryTextColor)),
              ],
            ),
            AppTextField(
              textFieldType: TextFieldType.NAME,
              textStyle: boldTextStyle(),
              decoration: InputDecoration(
                hintText: 'Enter description',
                hintStyle: secondaryTextStyle(),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: rcSecondaryTextColor)),
              ),
            ),
            30.height,
            Container(
              child: Text('Save', style: boldTextStyle(size: 18, color: Colors.white)).center(),
              width: context.width() - 40,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
            ).onTap(() {
              finish(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
          ],
        ).paddingAll(16);
      });
}

void showShareBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Share', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30)).center(),
            30.height,
            AppTextField(
              textFieldType: TextFieldType.NAME,
              textStyle: boldTextStyle(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.info_outlined, color: rcSecondaryTextColor),
                hintText: 'Enter description',
                hintStyle: secondaryTextStyle(),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: rcSecondaryTextColor)),
              ),
            ),
            16.height,
            Text('Share With', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 20)),
            16.height,
            Wrap(
              spacing: 16,
              children: shareNameList.map((e) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [rcProfileImage(e.path, 50, 50), 8.height, Text(e.name, style: primaryTextStyle())],
                );
              }).toList(),
            ),
            16.height,
            Text('CopyLink', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 20)),
            16.height,
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'https://ui8.net/',
                    style: secondaryTextStyle(),
                    overflow: TextOverflow.ellipsis,
                  ).center(),
                  Icon(Icons.copy, color: primaryColor).onTap(() {
                    Clipboard.setData(ClipboardData(text: "https://ui8.net/"));
                    toast('Link Copied.', bgColor: Colors.black.withOpacity(0.5));
                  })
                ],
              ),
              width: context.width() - 40,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(borderRadius: radius(32), color: rcSecondaryColor),
            ),
            30.height,
            Container(
              child: Text('Share', style: boldTextStyle(size: 18, color: Colors.white)).center(),
              width: context.width() - 40,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
            ).onTap(() {
              finish(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
          ],
        ).paddingAll(16);
      });
}

void showSortBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Sort', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30)).center(), 16.height, RCSortComponent()],
        ).paddingAll(16);
      });
}

void showFilterBottomSheet(BuildContext context) {
  bool checkboxOne = false;
  bool checkboxTwo = true;
  bool checkboxThree = false;
  bool checkboxFour = true;

  bool switchOne = false;
  bool switchTwo = true;
  bool switchThree = true;

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30)).center(),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CUISINE', style: boldTextStyle()),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: primaryColor),
                          4.width,
                          Text('More Cuisine', style: boldTextStyle(color: primaryColor)),
                        ],
                      )
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chinese',
                        style: primaryTextStyle(),
                      ),
                      IconButton(
                        icon: checkboxOne ? Icon(LineIcons.check_square, color: primaryColor, size: 30) : Icon(Icons.crop_square_sharp, size: 30, color: rcSecondaryTextColor),
                        onPressed: () {
                          checkboxOne = !checkboxOne;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Italian',
                        style: primaryTextStyle(),
                      ),
                      IconButton(
                        icon: checkboxTwo ? Icon(LineIcons.check_square, color: primaryColor, size: 30) : Icon(Icons.crop_square_sharp, size: 30, color: rcSecondaryTextColor),
                        onPressed: () {
                          checkboxTwo = !checkboxTwo;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('OCCASION', style: boldTextStyle()),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: primaryColor),
                          4.width,
                          Text('More Occasion', style: boldTextStyle(color: primaryColor)),
                        ],
                      )
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weeknight dinner',
                        style: primaryTextStyle(),
                      ),
                      IconButton(
                        icon: checkboxThree ? Icon(LineIcons.check_square, color: primaryColor, size: 30) : Icon(Icons.crop_square_sharp, size: 30, color: rcSecondaryTextColor),
                        onPressed: () {
                          checkboxThree = !checkboxThree;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prepare ahead',
                        style: primaryTextStyle(),
                      ),
                      IconButton(
                        icon: checkboxFour ? Icon(LineIcons.check_square, color: primaryColor, size: 30) : Icon(Icons.crop_square_sharp, size: 30, color: rcSecondaryTextColor),
                        onPressed: () {
                          checkboxFour = !checkboxFour;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  16.height,
                  Text('TYPE', style: boldTextStyle()),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recipes', style: primaryTextStyle()),
                      Switch(
                        value: switchOne,
                        onChanged: (val) {
                          switchOne = val.validate();
                          setState(() {});
                        },
                        activeColor: Colors.white,
                        activeTrackColor: primaryColor,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('How To', style: primaryTextStyle()),
                      Switch(
                        value: switchTwo,
                        onChanged: (val) {
                          switchTwo = val.validate();
                          setState(() {});
                        },
                        activeColor: Colors.white,
                        activeTrackColor: primaryColor,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Articles', style: primaryTextStyle()),
                      Switch(
                        value: switchThree,
                        onChanged: (val) {
                          switchThree = val.validate();
                          setState(() {});
                        },
                        activeColor: Colors.white,
                        activeTrackColor: primaryColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('Cancel', style: boldTextStyle(size: 18, color: primaryColor)).center(),
                        width: context.width() / 2 - 32,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(borderRadius: radius(32), border: Border.all(color: primaryColor)),
                      ).onTap(() {
                        finish(context);
                      }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                      16.width,
                      Container(
                        child: Text('Done', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                        width: context.width() / 2 - 32,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor),
                      ).onTap(() {
                        finish(context);
                      }, splashColor: Colors.transparent, highlightColor: Colors.transparent)
                    ],
                  ),
                ],
              ).paddingAll(16),
            );
          },
        );
      });
}

void showVideoBottomSheet(BuildContext context, RCVideoModel element) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('How to video', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 30)).center(),
              70.height,
              Stack(
                children: [
                  rcCommonCachedNetworkImage(element.path, height: 150, width: context.width() - 32, fit: BoxFit.cover).cornerRadiusWithClipRRect(20),
                  Container(
                    height: 150,
                    width: context.width() - 32,
                    decoration: BoxDecoration(borderRadius: radius(20), color: Colors.black.withOpacity(0.2)),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          RCVideoPlayerScreen().launch(context);
                        },
                        icon: Icon(
                          Icons.play_circle,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              16.height,
              Text(element.title, style: boldTextStyle()),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(LineIcons.clock, color: rcSecondaryTextColor),
                      4.width,
                      Text(element.time, style: secondaryTextStyle(color: rcSecondaryTextColor)),
                    ],
                  ),
                  20.width,
                  Row(
                    children: [
                      Icon(LineIcons.eye, color: rcSecondaryTextColor),
                      4.width,
                      Text(element.views, style: secondaryTextStyle(color: rcSecondaryTextColor)),
                    ],
                  )
                ],
              ),
              100.height,
            ],
          ).paddingAll(16),
        );
      });
}
