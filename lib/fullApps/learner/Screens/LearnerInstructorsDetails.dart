import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerInstructorsDetails extends StatefulWidget {
  @override
  _LearnerInstructorsDetailsState createState() => _LearnerInstructorsDetailsState();
}

class _LearnerInstructorsDetailsState extends State<LearnerInstructorsDetails> {
  late List<LearnerFeaturedModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetFavourites();
  }

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
        Container(
          width: 120,
          alignment: Alignment.center,
          child: LearnerButton(
            onPressed: () {
              finish(context);
            },
            textContent: learner_lbl_Follow,
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
                Text("5.0", style: primaryTextStyle(color: learner_textColorPrimary)),
                4.height,
                Text(learner_lbl_Ratting, style: boldTextStyle(color: learner_textColorSecondary)),
              ],
            ).center(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("1.6 K", style: primaryTextStyle(color: learner_textColorPrimary)),
                4.height,
                Text(learner_lbl_Stud, style: boldTextStyle(color: learner_textColorSecondary)),
              ],
            ).paddingAll(8)
          ],
        ).paddingOnly(left: 16, right: 16, top: 16)
      ],
    );
    final cardList = ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: mList1.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: boxDecoration(showShadow: true, bgColor: context.cardColor, radius: 10.0),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: mList1[index].img,
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ).cornerRadiusWithClipRRect(25),
              8.width,
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(mList1[index].name, style: boldTextStyle(color: learner_textColorPrimary)),
                            4.height,
                            Text(mList1[index].type, style: secondaryTextStyle(color: learner_textColorPrimary)),
                          ],
                        ).expand(),
                        2.width,
                        Icon(Icons.favorite, color: Colors.red, size: 30),
                      ],
                    ),
                    Divider(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("20", style: boldTextStyle(color: learner_textColorPrimary)),
                            4.height,
                            Text("Students", style: boldTextStyle(color: learner_textColorPrimary)),
                          ],
                        ),
                        8.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("51", style: boldTextStyle(color: learner_textColorPrimary)),
                            4.height,
                            Text("Lectures", style: boldTextStyle(color: learner_textColorPrimary)),
                          ],
                        ).expand(),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(mList1[index].price, style: boldTextStyle(color: learner_white)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ).paddingAll(16),
        );
      },
    );

    return Scaffold(
      // backgroundColor: learner_layout_background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          //  color: learner_layout_background,
          child: SafeArea(
            child: Container(
              //   color: learner_layout_background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  8.height,
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              topView,
              24.height,
              cardList,
            ],
          ),
        ),
      ),
    );
  }
}
