import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerInstructorsDetails.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerSearch extends StatefulWidget {
  @override
  _LearnerSearchState createState() => _LearnerSearchState();
}

class _LearnerSearchState extends State<LearnerSearch> {
  late List<LearnerPeopleModel> mList1;
  late List<LearnerPeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetInstructor();
    mList2 = learnerGetRecommended();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: boxDecoration(showShadow: true, bgColor: context.cardColor, radius: 0),
          padding: EdgeInsets.fromLTRB(12, 16, 16, 12),
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.search, color: learner_colorPrimary, size: 20).paddingSymmetric(horizontal: 8),
                  Text(learner_hint_search, style: primaryTextStyle(color: learner_textColorSecondary)),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(learner_lbl_filter, style: TextStyle(fontSize: textSizeMedium, color: learner_colorPrimary)),
                  Icon(Icons.close, color: learner_textColorSecondary, size: 20).paddingSymmetric(horizontal: 8),
                ],
              ),
            ],
          ),
        ),
        8.height,
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Text(
            learner_lbl_top_instructors,
            style: boldTextStyle(color: learner_textColorPrimary, size: 18),
          ),
        ),
        16.height,
        SizedBox(
          height: 145,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mList1.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return LearnerInstructor(mList1[index], index);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 16),
          child: Text(learner_lbl_recommended, style: boldTextStyle(color: learner_textColorPrimary, size: 18)),
        ),
        16.height,
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mList2.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LearnerRecommended(mList2[index], index);
              }),
        ),
      ],
    ));
  }
}

// ignore: must_be_immutable
class LearnerInstructor extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerInstructor(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(model.img),
                radius: w * 0.1,
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: model.isOnline ? learner_green : learner_greyColor.withOpacity(1.0),
                  shape: BoxShape.circle,
                  border: Border.all(color: learner_white, width: 1.5),
                ),
              ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 2)
            ],
          ),
          8.height,
          Text(model.name, style: boldTextStyle()),
          Text(model.subject, style: secondaryTextStyle(color: learner_textColorSecondary)),
        ],
      ),
    ).onTap(
      () {
        LearnerInstructorsDetails().launch(context);
      },
    );
  }
}

// ignore: must_be_immutable
class LearnerRecommended extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerRecommended(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 8),
      child: CircleAvatar(
        radius: w * 0.1,
        backgroundImage: CachedNetworkImageProvider(model.img),
      ),
    );
  }
}
