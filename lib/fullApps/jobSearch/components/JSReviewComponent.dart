import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';

class JSReviewComponent extends StatefulWidget {
  @override
  _JSReviewComponentState createState() => _JSReviewComponentState();
}

class _JSReviewComponentState extends State<JSReviewComponent> {
  List<JSPopularCompanyModel> questionList = getQuestionList();

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
    return ListView.builder(
      itemCount: questionList.length,
      padding: EdgeInsets.symmetric(horizontal: 8),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        JSPopularCompanyModel data = questionList[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.companyName.validate(),
              style: boldTextStyle(size: 18),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            8.height,
            Text(data.companyImage.validate(), style: secondaryTextStyle()),
            16.height,
            Text(
              data.totalDays.validate(),
              style: primaryTextStyle(),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            8.height,
            Row(
              children: [
                Text(data.dateAnswere.validate(), style: secondaryTextStyle()),
                8.width,
                Container(width: 1, height: 10, color: gray.withOpacity(0.4)),
                8.width,
                Text(
                  data.totalReview.validate(),
                  style: secondaryTextStyle(color: js_primaryColor.withOpacity(0.8), decoration: TextDecoration.underline),
                ),
              ],
            )
          ],
        ).paddingAll(16);
      },
    );
  }
}
