import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCCollectionModel.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

class RCCollectionComponent extends StatefulWidget {
  RCCollectionModel e;

  RCCollectionComponent({required this.e});

  @override
  _RCCollectionComponentState createState() => _RCCollectionComponentState();
}

class _RCCollectionComponentState extends State<RCCollectionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: widget.e.selected ? primaryColor : rcSecondaryColor.withAlpha(130), width: 2),
          borderRadius: radius(20),
          color: widget.e.selected ? primaryColor.withAlpha(30) : rcSecondaryColor.withAlpha(130)),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          rcCommonCachedNetworkImage(
            widget.e.image,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(12),
          8.width,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.e.name,
                style: boldTextStyle(),
              ),
              4.height,
              Text(
                '${widget.e.numberOfPosts} posts',
                style: secondaryTextStyle(color: rcSecondaryTextColor),
              )
            ],
          )
        ],
      ),
    ).onTap(() {
      widget.e.selected = !widget.e.selected;
      setState(() {});
    }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
  }
}
