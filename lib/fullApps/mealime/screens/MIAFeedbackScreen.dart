import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';

class MIAFeedbackScreen extends StatelessWidget {
  const MIAFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                miaCommonCachedNetworkImage('$BaseUrl/images/mealime/x.png', height: 20, color: context.iconColor).onTap(() {
                  finish(context);
                }),
                Text('FeedBack', style: boldTextStyle()),
                SizedBox(width: 8)
              ],
            ).paddingAll(16),
            Divider(),
            Text('How was this recipe?', style: boldTextStyle()).paddingAll(16),
            30.height,
            RatingBar(
              initialRating: 0,
              minRating: 5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 50,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: miaPrimaryColor,
              ),
              onRatingUpdate: (rating) {
                //
              },
            ).center(),
            50.height,
            Text('Comments for chef?', style: boldTextStyle()).paddingAll(16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: radius(8), color: appStore.isDarkModeOn ? context.cardColor : miaContainerSecondaryColor),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                cursorColor: miaPrimaryColor,
                autofocus: true,
                minLines: 5,
                maxLines: 5,
              ),
            ),
            AppButton(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: context.width() - 32,
              color: miaPrimaryColor,
              text: 'Send',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                finish(context);
                toast('Feedback received. Thanks!');
              },
            )
          ],
        ),
      ),
    );
  }
}
