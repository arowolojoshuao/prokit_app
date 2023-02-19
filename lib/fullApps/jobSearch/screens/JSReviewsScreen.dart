import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSImage.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

class JSReviewsScreen extends StatefulWidget {
  final JSPopularCompanyModel? popularCompanyList;

  JSReviewsScreen({this.popularCompanyList});

  @override
  _JSReviewsScreenState createState() => _JSReviewsScreenState();
}

class _JSReviewsScreenState extends State<JSReviewsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width(),
            padding: EdgeInsets.all(16),
            color: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text("Sort by", style: boldTextStyle()),
                8.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(spreadRadius: 0.6, blurRadius: 1, color: gray.withOpacity(0.5)),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Helpfulness", textAlign: TextAlign.center, style: boldTextStyle(color: js_primaryColor.withOpacity(0.7))),
                      Container(height: 20, width: 1, color: gray),
                      Text("Rating", style: boldTextStyle(color: js_primaryColor.withOpacity(0.7))),
                      Container(height: 20, width: 1, color: gray),
                      Row(
                        children: [
                          Text("Date", style: boldTextStyle(color: js_primaryColor.withOpacity(0.7))),
                          8.width,
                          Icon(Icons.download_rounded, size: 18),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Found ", style: secondaryTextStyle()),
                  Text("1,654 ", style: boldTextStyle()),
                  Text("reviews matching the search", style: secondaryTextStyle()),
                ],
              ),
              8.height,
              Text("See all 8,456 reviews ", style: primaryTextStyle(color: js_primaryColor.withOpacity(0.7))),
              24.height,
              Row(
                children: [
                  Text(widget.popularCompanyList!.companyRatting.toString(), style: boldTextStyle()),
                  16.width,
                  RatingBar(
                    initialRating: widget.popularCompanyList!.companyRatting.validate(),
                    minRating: 1,
                    itemSize: 16,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: js_ratingColor,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              8.height,
              Text("assistant branch manager", style: boldTextStyle()),
              8.height,
              Text("assistant branch manager (Current Employee)- East", style: secondaryTextStyle(decoration: TextDecoration.underline)),
              8.height,
              Text("London, Greater London 26 June 2021", style: secondaryTextStyle(decoration: TextDecoration.underline)),
              16.height,
              Container(
                width: context.width(),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_ratingCardBgColor,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    commonCachedNetworkImage(js_mic, width: 40, height: 40, fit: BoxFit.cover),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Indeed feature review", style: boldTextStyle()),
                        8.height,
                        Text(
                          "The most useful review selected by indeed",
                          style: primaryTextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ).expand(),
                  ],
                ),
              ),
              16.height,
              Text("Responsible for chash handling- cashing up tills, counting safe and etc", style: secondaryTextStyle()),
              16.height,
            ],
          ).paddingAll(16)
        ],
      ),
    );
  }
}
