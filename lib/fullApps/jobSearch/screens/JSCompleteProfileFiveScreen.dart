import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSHomeScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSConstant.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppWidget.dart';

class JSCompleteProfileFiveScreen extends StatefulWidget {
  const JSCompleteProfileFiveScreen({Key? key}) : super(key: key);

  @override
  _JSCompleteProfileFiveScreenState createState() => _JSCompleteProfileFiveScreenState();
}

class _JSCompleteProfileFiveScreenState extends State<JSCompleteProfileFiveScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  List<JSPopularCompanyModel> desireJobTypeList = getDesireJobTypeList();

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.height,
                jsCompleteProfileStep(context, hideCV: false, stepSubTitle: 5),
                16.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Job Preference", style: boldTextStyle(size: 22)),
                    16.height,
                    Text("Desired Job Title", style: boldTextStyle()),
                    Container(
                      height: textFieldHeight,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 16),
                      decoration: boxDecoration(radius: 8, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
                      child: AppTextField(
                        textFieldType: TextFieldType.OTHER,
                        decoration: jsInputDecoration(),
                      ),
                    ),
                    16.height,
                    Text("Desired Job Type", style: boldTextStyle()),
                    8.height,
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: desireJobTypeList
                          .map(
                            (desireJobTypeList) => CheckboxListTile(
                              title: Text(desireJobTypeList.companyName.validate(), style: boldTextStyle()),
                              value: desireJobTypeList.isBlocked.validate(),
                              dense: true,
                              activeColor: js_primaryColor,
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.all(0),
                              onChanged: (bool? val) {
                                setState(() {
                                  desireJobTypeList.isBlocked = val!;
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
              ],
            ).paddingOnly(bottom: 70),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 8,
            child: AppButton(
              color: js_primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              onTap: () {
                JSHomeScreen().launch(context);
              },
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              child: Text("Save", style: boldTextStyle(color: white)),
            ),
          ),
        ],
      ),
    );
  }
}
