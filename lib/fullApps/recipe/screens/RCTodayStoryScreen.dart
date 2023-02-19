import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCBackComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCCollectionModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCStoryBlogScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCBottomSheet.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCClipperPaths.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCHomeStoryModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCTodayStoryScreen extends StatefulWidget {
  RCHomeStoryModel element;

  RCTodayStoryScreen({required this.element});

  @override
  State<RCTodayStoryScreen> createState() => _RCTodayStoryScreenState();
}

class _RCTodayStoryScreenState extends State<RCTodayStoryScreen> {
  List<RCCollectionModel> collectionList = [];

  @override
  void initState() {
    super.initState();

    collectionList.add(RCCollectionModel(name: 'Cookbook', image: '$BaseUrl/images/recipe/coffee.jpg', numberOfPosts: '15', selected: false));
    collectionList.add(RCCollectionModel(name: 'Ice Cream', image: '$BaseUrl/images/recipe/milkShakes.jpg', numberOfPosts: '3', selected: false));
    collectionList.add(RCCollectionModel(name: 'Cake Recipe', image: '$BaseUrl/images/recipe/strawberryCupcake.jpg', numberOfPosts: '48', selected: false));

    setStatusBarColor(Colors.transparent);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? Colors.black : Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          rcCommonCachedNetworkImage('$BaseUrl/images/recipe/panCake.jpg', height: context.height(), width: context.width(), fit: BoxFit.cover),
          Positioned(
            top: context.statusBarHeight + 24,
            left: 16,
            child: RCBackComponent(color: Colors.white, borderColor: Colors.white),
          ),
          Positioned(
            top: 150,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today\'s', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily, color: Colors.white)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Story', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily, color: Colors.white)),
                    16.width,
                    Container(height: 2, width: 200, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Container(
              child: Stack(
                children: [
                  ClipPath(
                    clipper: BackgroundClipperOne(),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: context.width() - 32,
                      height: 210,
                      decoration: BoxDecoration(borderRadius: radius(30), color: appStore.isDarkModeOn ? Colors.black : Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              rcProfileImage(widget.element.img, 40, 40),
                              8.width,
                              Text(
                                widget.element.name,
                                style: boldTextStyle(color: primaryColor),
                              )
                            ],
                          ),
                          16.height,
                          Text(widget.element.title, style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 18)),
                          16.height,
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            ClipPath(
                              clipper: BackgroundClipperTwo(),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: widget.element.selected ? Colors.red.withAlpha(30) : rcSecondaryColor, borderRadius: radius(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    widget.element.selected ? Icon(LineIcons.heart_1, color: Colors.red) : Icon(LineIcons.heart, color: rcSecondaryTextColor),
                                    4.width,
                                    Text(widget.element.likes.toString(), style: secondaryTextStyle(weight: FontWeight.bold, color: widget.element.selected ? Colors.red : rcSecondaryTextColor))
                                  ],
                                ),
                              ).onTap(() {
                                widget.element.selected = !widget.element.selected;
                                setState(() {});
                              }),
                            ),
                            ClipPath(
                              clipper: BackgroundClipperTwo(),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: rcSecondaryColor, borderRadius: radius(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(LineIcons.bookmark, color: rcSecondaryTextColor),
                                    4.width,
                                    Text('Save', style: secondaryTextStyle(weight: FontWeight.bold, color: rcSecondaryTextColor))
                                  ],
                                ),
                              ).onTap(() {
                                showSaveBottomSheet(context, collectionList);
                              }),
                            ),
                            ClipPath(
                              clipper: BackgroundClipperTwo(),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: rcSecondaryColor, borderRadius: radius(12)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.share, color: rcSecondaryTextColor), 4.width, Text('Share', style: secondaryTextStyle(weight: FontWeight.bold, color: rcSecondaryTextColor))],
                                ),
                              ).onTap(() {
                                showShareBottomSheet(context);
                              }),
                            ),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Container(
                        decoration: BoxDecoration(color: primaryColor, borderRadius: radius(16)),
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: () {
                            RCStoryBlogScreen(element: widget.element, collectionList: collectionList).launch(context);
                          },
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
