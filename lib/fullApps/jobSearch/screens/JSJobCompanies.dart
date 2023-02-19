import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSPopularCompanyComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSJobSearchScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSConstant.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppWidget.dart';

class JSJobCompanies extends StatefulWidget {
  const JSJobCompanies({Key? key}) : super(key: key);

  @override
  _JSJobCompaniesState createState() => _JSJobCompaniesState();
}

class _JSJobCompaniesState extends State<JSJobCompanies> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
    return Scaffold(
      key: scaffoldKey,
      appBar: jsAppBar(context, notifications: false, message: false, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: JSDrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text("Find great Place to work", style: boldTextStyle(size: 22)),
                8.height,
                Text("Get access to millions of company reviews", style: secondaryTextStyle()),
                8.height,
                Text("Company name or job title", style: boldTextStyle()),
                16.height,
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    textFieldType: TextFieldType.OTHER,
                    keyboardType: TextInputType.text,
                    decoration: jsInputDecoration(icon: Icon(Icons.search)),
                  ),
                ),
                8.height,
                AppButton(
                  color: js_primaryColor,
                  width: context.width(),
                  onTap: () {
                    JSJobSearchScreen().launch(context);
                  },
                  child: Text("Find Companies", style: boldTextStyle(color: white)),
                ),
                16.height,
                Text("Do you want to search for salaries?", style: boldTextStyle(color: js_textColor.withOpacity(0.7), decoration: TextDecoration.underline), textAlign: TextAlign.center).center(),
                32.height,
                Text("Popular Companies", style: boldTextStyle(decoration: TextDecoration.underline, size: 18)),
                16.height,
                JsPopularCompanyComponent(),
              ],
            ).paddingOnly(left: 16, right: 16, bottom: 24)
          ],
        ),
      ),
    );
  }
}
