import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerDescription extends StatefulWidget {
  static String tag = '/LearnerDescription';

  @override
  _LearnerDescriptionState createState() => _LearnerDescriptionState();
}

class _LearnerDescriptionState extends State<LearnerDescription> {
  late List<LearnerContentModel> mList;

  @override
  void initState() {
    super.initState();
    mList = learnerGetContents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 390,
                  margin: EdgeInsets.fromLTRB(16, 30, 16, 16),
                  decoration: boxDecoration(showShadow: true, radius: 16, bgColor: context.cardColor),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: learner_climb,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      16.height,
                      Text(learner_lbl_project_management, style: boldTextStyle()),
                      8.height,
                      Container(
                        decoration: boxDecoration(bgColor: learner_green, radius: 8, showShadow: false),
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: Text(learner_lbl_30_80, style: boldTextStyle()),
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LearnerOptionDescription(learner_lbl_1_6k, learner_lbl_students),
                          LearnerOptionDescription(learner_lbl_5_0, learner_lbl_rating),
                          LearnerOptionDescription(learner_lbl_37, learner_lbl_lectures),
                        ],
                      )
                    ],
                  ),
                ),
                8.height,
                Column(
                  children: [
                    Icon(Icons.keyboard_arrow_up, color: learner_textColorSecondary),
                    Text(
                      learner_lbl_swipe_up_to_show_course_contents,
                      style: primaryTextStyle(color: learner_textColorSecondary),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(16.0),
                  child: Icon(Icons.close, color: learner_textColorSecondary, size: 20),
                ),
                Text(learner_lbl_project_management, style: boldTextStyle(size: 20)),
                8.height,
                Container(
                  decoration: boxDecoration(bgColor: learner_green, radius: 8, showShadow: false),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                    child: Text(learner_lbl_30_80, style: boldTextStyle(color: learner_white)),
                  ),
                ),
                16.height,
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(learner_ic_Profile),
                            radius: MediaQuery.of(context).size.height * 0.025,
                          ),
                          16.width,
                          Text(learner_lbl_hannah_tran, style: boldTextStyle(color: learner_colorPrimary))
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.star, color: learner_yellow, size: 16).paddingSymmetric(horizontal: 8),
                            ),
                            TextSpan(
                              text: learner_lbl_5_0,
                              style: TextStyle(fontSize: textSizeMedium, color: learner_yellow, fontFamily: fontMedium),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                16.height,
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerQuestion(mList[index], index);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerQuestion extends StatelessWidget {
  late LearnerContentModel model;

  LearnerQuestion(LearnerContentModel model, int pos) {
    this.model = model;
  }

  var i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: <Widget>[
          Text("1", style: boldTextStyle(color: learner_textColorSecondary)),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name, style: boldTextStyle()),
              Text(model.subtitle, style: primaryTextStyle()),
              Text(model.type, style: secondaryTextStyle(color: learner_colorPrimary)),
            ],
          ).expand()
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget LearnerOptionDescription(var total, var type) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: <Widget>[
        Image.asset(learner_ic_cup, height: 20, width: 20),
        4.height,
        Text(total, style: boldTextStyle()),
        4.height,
        Text(type, style: secondaryTextStyle()),
      ],
    ),
  );
}
