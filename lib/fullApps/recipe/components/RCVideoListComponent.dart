import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/models/RCVideoModel.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCBottomSheet.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCClipperPaths.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCCommon.dart';

class RCVideoListComponent extends StatelessWidget {
  RCVideoModel element;

  RCVideoListComponent(this.element);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      height: 220,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: BackgroundClipperOne(),
                child: Container(
                  width: context.width() / 2,
                  height: 150,
                  decoration: BoxDecoration(borderRadius: radius(30), color: rcSecondaryColor),
                  child: rcCommonCachedNetworkImage(element.path, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                ),
              ),
              ClipPath(
                clipper: BackgroundClipperOne(),
                child: Container(
                  width: context.width() / 2,
                  height: 150,
                  decoration: BoxDecoration(borderRadius: radius(30), color: Colors.black.withOpacity(0.2)),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_circle,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  showVideoBottomSheet(context, element);
                },
              )
            ],
          ),
          Positioned(
            top: 154,
            child: Container(
              width: context.width() / 2,
              child: Text(element.title, style: boldTextStyle(), maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(LineIcons.clock, color: rcSecondaryTextColor, size: 16),
                    4.width,
                    Text(element.time, style: secondaryTextStyle(color: rcSecondaryTextColor, size: 10)),
                  ],
                ),
                20.width,
                Row(
                  children: [
                    Icon(LineIcons.eye, color: rcSecondaryTextColor, size: 16),
                    4.width,
                    Text(element.views, style: secondaryTextStyle(color: rcSecondaryTextColor, size: 10)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
