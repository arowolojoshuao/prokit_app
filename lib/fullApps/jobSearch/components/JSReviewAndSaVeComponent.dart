import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';

class JSReviewAndSaVeComponent extends StatefulWidget {
  final JSPopularCompanyModel? reviewDraftList;

  JSReviewAndSaVeComponent({this.reviewDraftList});

  @override
  _JSReviewAndSaVeComponentState createState() => _JSReviewAndSaVeComponentState();
}

class _JSReviewAndSaVeComponentState extends State<JSReviewAndSaVeComponent> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(spreadRadius: 0.6, blurRadius: 1, color: gray.withOpacity(0.5)),
            ],
            backgroundColor: context.scaffoldBackgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.reviewDraftList!.companyName.validate(), style: boldTextStyle()),
                  16.width,
                  Icon(Icons.edit, color: js_primaryColor, size: 18),
                ],
              ),
              24.height,
              Text(widget.reviewDraftList!.companyImage.validate(), style: boldTextStyle(size: 22)),
              8.height,
              Text(widget.reviewDraftList!.totalDays.validate(), style: primaryTextStyle()),
              8.height,
              Text(widget.reviewDraftList!.index.toString().validate(), style: primaryTextStyle(color: js_primaryColor, decoration: TextDecoration.underline)),
              24.height,
              Row(
                children: [
                  Icon(Icons.add_circle_outline, color: js_primaryColor).onTap(() {
                    //
                  }),
                  16.width,
                  Text("Add your headline or summary", style: boldTextStyle(color: js_primaryColor)),
                ],
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Personal Detail", style: secondaryTextStyle(size: 18)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline, color: js_primaryColor)),
                ],
              ),
              Divider(height: 0, color: gray.withOpacity(0.2)),
              16.height,
              Text(widget.reviewDraftList!.companyName.validate(), style: primaryTextStyle()),
              8.height,
              Text(widget.reviewDraftList!.companyImage.validate(), style: secondaryTextStyle()),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Work Experience", style: secondaryTextStyle(size: 18)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline, color: js_primaryColor)),
                ],
              ),
              Divider(height: 0, color: gray.withOpacity(0.2)),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.reviewDraftList!.dateAnswere.validate(), style: boldTextStyle()),
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: js_primaryColor)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: js_primaryColor)),
                    ],
                  ),
                ],
              ),
              Text(widget.reviewDraftList!.jobLocation.validate(), style: primaryTextStyle()),
              8.height,
              Text(widget.reviewDraftList!.totalReview.validate(), style: secondaryTextStyle()),
              8.height,
              Text(widget.reviewDraftList!.jobDescription.validate(), style: primaryTextStyle()),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Education", style: secondaryTextStyle(size: 18)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline, color: js_primaryColor)),
                ],
              ),
              Divider(height: 0, color: gray.withOpacity(0.2)),
              8.height,
              Text(widget.reviewDraftList!.deegryName.validate(), style: boldTextStyle()),
              8.height,
              Text(widget.reviewDraftList!.deegryCompleteYear.validate(), style: secondaryTextStyle()),
              8.height,
              Text(widget.reviewDraftList!.deegryDescription.validate(), style: primaryTextStyle()),
              24.height,
            ],
          ),
        ),
      ],
    );
  }
}
