import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import 'GroceryWriteReview.dart';

class GroceryReviews extends StatefulWidget {
  static String tag = '/GroceryReviews';

  @override
  GroceryReviewsState createState() => GroceryReviewsState();
}

class GroceryReviewsState extends State<GroceryReviews> {
  late List<ReviewModel> mList;

  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
    mList = reviewsItem();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.25),
        child: TopBar(
          Icons.arrow_back,
          grocery_title_review,
          Icons.edit,
          () {
            GroceryWriteReview().launch(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Review(mList[index], index);
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Review extends StatelessWidget {
  late ReviewModel model;

  Review(ReviewModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithShadow(
        boxShadow: defaultBoxShadow(),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: context.cardColor,
      ),
      padding: EdgeInsets.all(spacing_middle),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundImage: CachedNetworkImageProvider(model.img)),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.name, style: boldTextStyle()),
                  Text(model.duration, style: secondaryTextStyle()),
                ],
              ),
              4.height,
              RatingBar(
                initialRating: 5,
                minRating: 1,
                itemSize: 20,
                direction: Axis.horizontal,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: grocery_color_yellow,
                ),
                onRatingUpdate: (rating) {},
              ),
              4.height,
              Text(model.description, style: secondaryTextStyle())
            ],
          ).expand()
        ],
      ),
    );
  }
}
