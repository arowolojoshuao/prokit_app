import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

class GroceryWriteReview extends StatefulWidget {
  static String tag = '/GroceryWriteReview';

  @override
  GroceryWriteReviewState createState() => GroceryWriteReviewState();
}

class GroceryWriteReviewState extends State<GroceryWriteReview> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget(
        grocery_title_write_review,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.close, color: appStore.isDarkModeOn ? white : black),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: width,
          decoration: boxDecorationWithShadow(
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(Grocery_ic_Profile),
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RatingBar(
                          initialRating: 5,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(Icons.star, color: grocery_color_yellow),
                          onRatingUpdate: (rating) {},
                        ),
                        8.height,
                        Text(grocery_username, style: boldTextStyle()),
                      ],
                    )
                  ],
                ).paddingAll(spacing_standard_new),
                EditText(
                  text: grocery_title_write_review,
                  isPassword: false,
                  keyboardType: TextInputType.text,
                ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("5 out of 50 Words", style: secondaryTextStyle()),
                    AppButton(
                      color: grocery_colorPrimary,
                      child: Text(grocery_lbl_send, style: boldTextStyle(color: white)),
                      onTap: () {
                        //
                      },
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    )
                  ],
                ).paddingAll(spacing_standard_new),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
