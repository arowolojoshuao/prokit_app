import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVPostModel.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/home/screens/SVCommentScreen.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVPostComponent extends StatefulWidget {
  @override
  State<SVPostComponent> createState() => _SVPostComponentState();
}

class _SVPostComponentState extends State<SVPostComponent> {
  List<SVPostModel> postList = getPosts();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(borderRadius: radius(SVAppCommonRadius), color: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      svCommonCachedNetworkImage(
                        postList[index].profileImage.validate(),
                        height: 56,
                        width: 56,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(SVAppCommonRadius),
                      12.width,
                      Text(postList[index].name.validate(), style: boldTextStyle()),
                      4.width,
                      Image.asset('images/socialv/icons/ic_TickSquare.png', height: 14, width: 14, fit: BoxFit.cover),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  Row(
                    children: [
                      Text('${postList[index].time.validate()} ago', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                    ],
                  ).paddingSymmetric(horizontal: 8),
                ],
              ),
              16.height,
              postList[index].description.validate().isNotEmpty ? svRobotoText(text: postList[index].description.validate(), textAlign: TextAlign.start).paddingSymmetric(horizontal: 16) : Offstage(),
              postList[index].description.validate().isNotEmpty ? 16.height : Offstage(),
              svCommonCachedNetworkImage(
                postList[index].postImage.validate(),
                height: 300,
                width: context.width() - 32,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(SVAppCommonRadius).center(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/socialv/icons/ic_Chat.png',
                        height: 22,
                        width: 22,
                        fit: BoxFit.cover,
                        color: context.iconColor,
                      ).onTap(() {
                        SVCommentScreen().launch(context);
                      }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                      IconButton(
                        icon: postList[index].like.validate()
                            ? Image.asset('images/socialv/icons/ic_HeartFilled.png', height: 20, width: 22, fit: BoxFit.fill)
                            : Image.asset(
                                'images/socialv/icons/ic_Heart.png',
                                height: 22,
                                width: 22,
                                fit: BoxFit.cover,
                                color: context.iconColor,
                              ),
                        onPressed: () {
                          postList[index].like = !postList[index].like.validate();
                          setState(() {});
                        },
                      ),
                      Image.asset(
                        'images/socialv/icons/ic_Send.png',
                        height: 22,
                        width: 22,
                        fit: BoxFit.cover,
                        color: context.iconColor,
                      ).onTap(() {
                        svShowShareBottomSheet(context);
                      }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                    ],
                  ),
                  Text('${postList[index].commentCount.validate()} comments', style: secondaryTextStyle(color: svGetBodyColor())),
                ],
              ).paddingSymmetric(horizontal: 16),
              Divider(indent: 16, endIndent: 16, height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 56,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                            child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_1.png', height: 24, width: 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                          ),
                          right: 0,
                        ),
                        Positioned(
                          left: 14,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                            child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_2.png', height: 24, width: 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2), borderRadius: radius(100)),
                            child: svCommonCachedNetworkImage('$BaseUrl/images/socialv/faces/face_3.png', height: 24, width: 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.width,
                  RichText(
                    text: TextSpan(
                      text: 'Liked By ',
                      style: secondaryTextStyle(color: svGetBodyColor(), size: 12),
                      children: <TextSpan>[
                        TextSpan(text: 'Ms.Mountain ', style: boldTextStyle(size: 12)),
                        TextSpan(text: 'And ', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
                        TextSpan(text: '1,10 Others ', style: boldTextStyle(size: 12)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
