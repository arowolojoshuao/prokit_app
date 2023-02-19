import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerFriendDetail extends StatefulWidget {
  @override
  _LearnerFriendDetailState createState() => _LearnerFriendDetailState();
}

class _LearnerFriendDetailState extends State<LearnerFriendDetail> {
  late List<LearnerBadgeModel> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = learnerGetBadges();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final topView = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: learner_ic_profile1,
              height: width * 0.3,
              width: width * 0.3,
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ).cornerRadiusWithClipRRect(60).paddingOnly(top: 16).center(),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: learner_green.withOpacity(1.0),
                shape: BoxShape.circle,
                border: Border.all(color: learner_white, width: 1.5),
              ),
            ).cornerRadiusWithClipRRect(7).paddingOnly(left: 80, top: 25).center()
          ],
        ),
        Text("Marc Elliot", style: boldTextStyle(color: learner_textColorPrimary, size: 18)).center().paddingOnly(top: 8),
        Text(learner_lbl_Student, style: primaryTextStyle(color: textSecondaryColor)).center().paddingOnly(top: 4),
        24.height,
        TextButton(
          onPressed: () {},
          child: Text("Add Friend", style: primaryTextStyle(color: learner_colorPrimary)).paddingAll(8),
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: learner_colorPrimary),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: learner_colorPrimary, width: 1.5, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("7", style: primaryTextStyle(color: learner_textColorPrimary)),
                4.height,
                Text(learner_lbl_Course, style: boldTextStyle(color: learner_textColorSecondary)),
              ],
            ).center(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("193,79", style: primaryTextStyle(color: learner_textColorPrimary)),
                4.height,
                Text(learner_lbl_Points, style: boldTextStyle(color: learner_textColorSecondary)),
              ],
            ).center(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("11", style: primaryTextStyle(color: learner_textColorPrimary)),
                4.height,
                Text(learner_lbl_Ranks, style: boldTextStyle(color: learner_textColorSecondary)),
              ],
            ).paddingAll(8)
          ],
        ).paddingOnly(left: 16, right: 16, top: 16)
      ],
    );

    final listingView = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: mList2.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LearnerBadges(mList2[index], index);
      },
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            35.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                  onPressed: () {
                    finish(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: learner_colorPrimary),
                  onPressed: () {
                    finish(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              topView,
              listingView,
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerBadges extends StatelessWidget {
  late LearnerBadgeModel model;

  LearnerBadges(LearnerBadgeModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: context.width() / 7,
            height: context.width() / 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: model.color),
            child: Image.asset(model.img).paddingAll(8),
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.name, style: boldTextStyle(color: learner_textColorPrimary)),
              4.height,
              Text(model.comment, style: secondaryTextStyle(color: learner_textColorSecondary)),
            ],
          ).expand()
        ],
      ),
    );
  }
}
