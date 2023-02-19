import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCReviewModel.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';
import 'package:prokit_flutter/main.dart';

class RCSingleReviewScreen extends StatefulWidget {
  RCReviewModel element;

  RCSingleReviewScreen({required this.element});

  @override
  State<RCSingleReviewScreen> createState() => _RCSingleReviewScreenState();
}

class _RCSingleReviewScreenState extends State<RCSingleReviewScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                  child: IconButton(
                    icon: Icon(Icons.cancel, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    onPressed: () {
                      finish(context);
                    },
                  )),
              Container(
                  decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                  child: IconButton(
                    icon: Icon(Icons.more_horiz, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    onPressed: () {},
                  )),
            ],
          ).paddingSymmetric(vertical: context.statusBarHeight + 12),
          rcCommonCachedNetworkImage(widget.element.foodImage, height: 400, width: context.width() - 16, fit: BoxFit.cover).cornerRadiusWithClipRRect(20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [rcProfileImage(widget.element.profile, 30, 30), 8.width, Text(widget.element.name, style: boldTextStyle())],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(LineIcons.clock, color: rcSecondaryTextColor),
                      4.width,
                      Text('${widget.element.time} ago', style: secondaryTextStyle(color: rcSecondaryTextColor)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      liked = !liked;
                      setState(() {});
                    },
                    icon: liked ? Icon(LineIcons.heart_1, color: Colors.red) : Icon(LineIcons.heart, color: rcSecondaryTextColor),
                  )
                ],
              )
            ],
          )
        ],
      ).paddingAll(16),
    );
  }
}
