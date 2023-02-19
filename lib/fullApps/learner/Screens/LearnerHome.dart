import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerHome extends StatefulWidget {
  @override
  _LearnerHomeState createState() => _LearnerHomeState();
}

class _LearnerHomeState extends State<LearnerHome> {
  late List<LearnerFeaturedModel> mList1;
  late List<LearnerCategoryModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetFavourites();
    mList2 = learnerGetCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(learner_lbl_featured, style: boldTextStyle()),
                  Text(learner_lbl_see_all, style: boldTextStyle(color: learner_colorPrimary)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 272,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList1.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return LearnerFeatured(mList1[index], index);
                },
              ),
            ),
            // SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: text(learner_lbl_categories, fontFamily: fontBold, fontSize: textSizeNormal),
            ),
            16.height,
            GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList2.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return LearnerCategory(mList2[index], index);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerFeatured extends StatelessWidget {
  late LearnerFeaturedModel model;

  LearnerFeatured(LearnerFeaturedModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.img,
              fit: BoxFit.cover,
              height: w * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name, style: boldTextStyle()),
                4.height,
                Text(model.price, style: primaryTextStyle(color: learner_textColorSecondary)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerCategory extends StatelessWidget {
  late LearnerCategoryModel model;

  LearnerCategory(LearnerCategoryModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                decoration: boxDecoration(bgColor: context.cardColor, radius: 12),
                child: Image.asset(
                  model.img,
                  height: context.width() * 0.17,
                  width: context.width(),
                ),
              ),
              8.height,
              Text(model.name, style: boldTextStyle()),
            ],
          ),
        ),
      ],
    );
  }
}
