import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

class RCCommentComponent extends StatefulWidget {
  String name;
  String path;
  String comment;
  String time;
  String likes;
  bool showLikes;
  bool liked;

  RCCommentComponent({required this.name, required this.comment, required this.time, required this.likes, required this.showLikes, required this.liked, required this.path});

  @override
  State<RCCommentComponent> createState() => _RCCommentComponentState();
}

class _RCCommentComponentState extends State<RCCommentComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                rcProfileImage(widget.path, 30, 30),
                8.width,
                Text(widget.name, style: boldTextStyle(size: 16)),
              ],
            ),
            Row(
              children: [
                Icon(LineIcons.clock, color: rcSecondaryTextColor),
                4.width,
                Text('${widget.time} ago', style: secondaryTextStyle(color: rcSecondaryTextColor)),
              ],
            ),
          ],
        ),
        8.height,
        Text(widget.comment, style: boldTextStyle()).paddingOnly(left: 50),
        widget.showLikes ? 8.height : Offstage(),
        widget.showLikes
            ? Row(
                children: [
                  widget.liked
                      ? Icon(LineIcons.heart_1, color: Colors.red).onTap(() {
                          widget.liked = !widget.liked;
                          setState(() {});
                        }, splashColor: Colors.transparent, highlightColor: Colors.transparent)
                      : Icon(LineIcons.heart, color: rcSecondaryTextColor).onTap(() {
                          widget.liked = !widget.liked;
                          setState(() {});
                        }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                  8.width,
                  Text(widget.likes, style: secondaryTextStyle(color: rcSecondaryTextColor)),
                  50.width,
                  Icon(LineIcons.comment, color: rcSecondaryTextColor),
                  8.width,
                  Text('Reply', style: secondaryTextStyle(color: rcSecondaryTextColor)),
                ],
              ).paddingOnly(left: 50)
            : Offstage()
      ],
    );
  }
}
