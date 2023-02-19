import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCHomeStoryModel.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCTodayStoryScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCClipperPaths.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

class RCMiniStoryComponent extends StatefulWidget {
  RCHomeStoryModel element;

  RCMiniStoryComponent({
    required this.element,
  });

  @override
  State<RCMiniStoryComponent> createState() => _RCMiniStoryComponentState();
}

class _RCMiniStoryComponentState extends State<RCMiniStoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 2 - 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Stack(
              children: [
                ClipPath(
                  clipper: BackgroundClipperThree(),
                  child: rcCommonCachedNetworkImage(widget.element.foodImg.validate(), fit: BoxFit.cover, height: 150, width: context.width() / 2 - 32).cornerRadiusWithClipRRect(30),
                ),
                Positioned(
                  right: 10,
                  child: ClipPath(
                    clipper: BackgroundClipperTwo(),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: widget.element.selected ? Colors.red.withAlpha(30) : rcSecondaryColor, borderRadius: radius(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.element.selected ? Icon(LineIcons.heart_1, color: Colors.red, size: 20) : Icon(LineIcons.heart, color: rcSecondaryTextColor, size: 20),
                          4.width,
                          Text(widget.element.likes.toString(), style: secondaryTextStyle(weight: FontWeight.bold, color: widget.element.selected ? Colors.red : rcSecondaryTextColor, size: 14))
                        ],
                      ),
                    ).onTap(() {
                      widget.element.selected = !widget.element.selected;
                      setState(() {});
                    }),
                  ),
                ),
              ],
            ),
          ),
          8.height,
          Row(
            children: [
              rcProfileImage(widget.element.img, 30, 30),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.element.name, style: boldTextStyle(color: primaryColor, size: 14)),
                  Text(widget.element.subTitle, style: primaryTextStyle(color: rcSecondaryTextColor, size: 10)),
                ],
              )
            ],
          ),
          8.height,
          Text(
            widget.element.title,
            style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ).onTap(() {
      RCTodayStoryScreen(element: widget.element).launch(context);
    });
  }
}

class RCMiniStoryComponentRecipe extends StatefulWidget {
  RCHomeStoryModel element;
  bool isProfile;

  RCMiniStoryComponentRecipe({required this.element, required this.isProfile});

  @override
  _RCMiniStoryComponentRecipeState createState() => _RCMiniStoryComponentRecipeState();
}

class _RCMiniStoryComponentRecipeState extends State<RCMiniStoryComponentRecipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: context.width() / 2 - 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(LineIcons.clock, color: rcSecondaryTextColor, size: 14),
                  2.width,
                  Text('${widget.element.time.validate()}', style: TextStyle(color: rcSecondaryTextColor, fontSize: 12)),
                ],
              ),
              ClipPath(
                clipper: BackgroundClipperTwo(),
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(color: widget.element.selected ? Colors.red.withAlpha(30) : rcSecondaryColor, borderRadius: radius(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.element.selected ? Icon(LineIcons.heart_1, color: Colors.red, size: 16) : Icon(LineIcons.heart, color: rcSecondaryTextColor, size: 16),
                      4.width,
                      Text(widget.element.likes.toString(), style: secondaryTextStyle(weight: FontWeight.bold, color: widget.element.selected ? Colors.red : rcSecondaryTextColor, size: 12))
                    ],
                  ),
                ).onTap(() {
                  widget.element.selected = !widget.element.selected;
                  setState(() {});
                }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              ),
            ],
          ),
          ClipPath(
            clipper: BackgroundClipperThree(),
            child: rcCommonCachedNetworkImage(widget.element.foodImg.validate(), fit: BoxFit.cover, height: 150, width: context.width() / 2 - 32).cornerRadiusWithClipRRect(30),
          ),
          8.height,
          widget.isProfile
              ? Offstage()
              : Row(
                  children: [
                    rcProfileImage(widget.element.img, 30, 30),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.element.name, style: boldTextStyle(color: primaryColor, size: 14)),
                        Text(widget.element.subTitle, style: primaryTextStyle(color: rcSecondaryTextColor, size: 10)),
                      ],
                    )
                  ],
                ),
          widget.isProfile ? Offstage() : 8.height,
          Text(
            widget.element.title,
            style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
