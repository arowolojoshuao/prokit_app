import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/main.dart';

class GroceryTermCondition extends StatefulWidget {
  static String tag = '/GroceryTermCondition';

  @override
  _GroceryTermConditionState createState() => _GroceryTermConditionState();
}

class _GroceryTermConditionState extends State<GroceryTermCondition> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBarWidget(
        grocery_lbl_Terms_and_Condition,
        color: grocery_colorPrimary,
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
          width: width,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Product Terms",
                style: boldTextStyle(),
              ),
              Text(grocery_lbl_Long_text, style: secondaryTextStyle()),
              24.height,
              Text(
                "1. Use of the site",
                style: boldTextStyle(),
              ),
              Text(grocery_lbl_Long_text, style: secondaryTextStyle()),
              16.height,
              Text("THESE TERMS AND CONDITIONS DO NOT AFFECT YOUR STATUTORY RIGHTS", style: boldTextStyle()),
              16.height,
              Text(
                "2. Amendments",
                style: boldTextStyle(),
              ),
              Text("we may revise the terms and conditions from time to time without notice to you. Lorem ipsum dolor sit.", style: secondaryTextStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
