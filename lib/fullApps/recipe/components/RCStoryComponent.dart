import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCHomeStoryModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCTodayStoryScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCClipperPaths.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

class RCStoryComponent extends StatefulWidget {
  RCHomeStoryModel element;
  bool isProfile;

  RCStoryComponent({required this.element, required this.isProfile});

  @override
  State<RCStoryComponent> createState() => _RCStoryComponentState();
}

class _RCStoryComponentState extends State<RCStoryComponent> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                  right: 14,
                  child: ClipPath(
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
                    }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                  ),
                ),
                ClipPath(
                  clipper: BackgroundClipperOne(),
                  child: Container(
                    width: context.width() - 32,
                    height: 150,
                    decoration: BoxDecoration(borderRadius: radius(30), color: rcSecondaryColor),
                    child: rcCommonCachedNetworkImage(widget.element.foodImg.validate(), fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                  ),
                ),
              ],
            ),
          ),
          12.height,
          widget.isProfile
              ? Offstage()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        rcProfileImage(widget.element.img, 30, 30),
                        8.width,
                        Text(
                          widget.element.name,
                          style: boldTextStyle(color: primaryColor),
                        )
                      ],
                    ),
                    Text(
                      widget.element.subTitle,
                      style: primaryTextStyle(color: rcSecondaryTextColor),
                    )
                  ],
                ),
          widget.isProfile ? Offstage() : 12.height,
          Text(widget.element.title, style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
        ],
      ).paddingSymmetric(horizontal: 16),
    ).onTap(() {
      RCTodayStoryScreen(element: widget.element).launch(context);
    }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
  }
}
