import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryGotQuestionScreen extends StatefulWidget {
  static String tag = '/GroceryGotQuestionScreen';

  @override
  _GroceryGotQuestionScreenState createState() => _GroceryGotQuestionScreenState();
}

class _GroceryGotQuestionScreenState extends State<GroceryGotQuestionScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        grocery_gotQuestion,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
        backWidget: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.close, color: appStore.isDarkModeOn ? white : black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: boxDecorationDefault(color: context.cardColor),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: Grocery_ic_Profile,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(35),
                  16.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(grocery_yourQuestion, style: boldTextStyle()),
                        4.height,
                        Text(grocery_questionAnswer, style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                ],
              ),
              EditText(text: grocery_typeQuestion, isPassword: false, keyboardType: TextInputType.text),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('0 of 50 ' + grocery_words, style: secondaryTextStyle()),
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery_send, style: boldTextStyle()),
                    color: grocery_colorPrimary,
                    onTap: () {
                      finish(context);
                    },
                  ),
                ],
              )
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 24),
        ).cornerRadiusWithClipRRect(15).paddingOnly(bottom: 16),
      ),
    );
  }
}
