import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSSearchResultScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSConstant.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppWidget.dart';

class JSJobSearchScreen extends StatefulWidget {
  const JSJobSearchScreen({Key? key}) : super(key: key);

  @override
  _JSJobSearchScreenState createState() => _JSJobSearchScreenState();
}

class _JSJobSearchScreenState extends State<JSJobSearchScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<JSPopularCompanyModel> popularSearchList = getPopularSearchList();

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  FocusNode jobTitleFocus = FocusNode();
  FocusNode cityFocus = FocusNode();

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
      appBar: jsAppBar(context, notifications: true, message: true, bottomSheet: true, backWidget: false, homeAction: false, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: JSDrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            8.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("What", style: boldTextStyle(size: 22)),
                8.height,
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: jobTitleController,
                    focus: jobTitleFocus,
                    nextFocus: cityFocus,
                    textFieldType: TextFieldType.OTHER,
                    keyboardType: TextInputType.text,
                    decoration: jsInputDecoration(hintText: "Job title,Keyword, or company", showPreFixIcon: false),
                  ),
                ),
                24.height,
                Text("Where", style: boldTextStyle(size: 22)),
                8.height,
                Container(
                  height: textFieldHeight,
                  alignment: Alignment.center,
                  decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                  child: AppTextField(
                    controller: cityController,
                    focus: cityFocus,
                    textFieldType: TextFieldType.EMAIL,
                    keyboardType: TextInputType.text,
                    decoration: jsInputDecoration(hintText: "city or postcode", icon: Icon(Icons.location_on)),
                  ),
                ),
                24.height,
                AppButton(
                  color: js_primaryColor,
                  width: context.width(),
                  onTap: () {
                    JSSearchResultScreen(jobTitle: jobTitleController.text, city: cityController.text).launch(context);
                  },
                  child: Text("Find Jobs", style: boldTextStyle(color: white)),
                ),
                24.height,
                Text("Popular searches", style: boldTextStyle(size: 22)),
                16.height,
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(
                    popularSearchList.length,
                    (index) {
                      JSPopularCompanyModel data = popularSearchList[index];

                      return Container(
                        decoration: boxDecorationWithRoundedCorners(
                          backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: context.width() * 0.5 - 24,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                        child: Row(
                          children: [
                            Icon(Icons.search, size: 18),
                            16.width,
                            Text(
                              data.companyName.validate(),
                              style: boldTextStyle(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ).flexible(),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 24),
          ],
        ),
      ),
    );
  }
}
