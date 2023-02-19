import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryChangePassword extends StatefulWidget {
  static String tag = '/GroceryChangePassword';

  @override
  _GroceryChangePasswordState createState() => _GroceryChangePasswordState();
}

class _GroceryChangePasswordState extends State<GroceryChangePassword> {
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
        grocery_lbl_Change_Password,
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
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            children: <Widget>[
              EditText(text: grocery_lbl_old_Password),
              4.height,
              EditText(text: grocery_lbl_new_Password),
              4.height,
              EditText(text: grocery_lbl_confirm_Password),
              16.height,
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  color: grocery_colorPrimary,
                  child: Text(grocery_lbl_Save.toUpperCase(), style: boldTextStyle(color: white)),
                  onTap: () {
                    toast("Change Password Successfully");
                    finish(context);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
