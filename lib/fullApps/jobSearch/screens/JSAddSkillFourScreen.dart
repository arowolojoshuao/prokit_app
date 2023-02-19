import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSSkillComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSCompleteProfileFiveScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSAddSkillFourScreen extends StatefulWidget {
  const JSAddSkillFourScreen({Key? key}) : super(key: key);

  @override
  _JSAddSkillFourScreenState createState() => _JSAddSkillFourScreenState();
}

class _JSAddSkillFourScreenState extends State<JSAddSkillFourScreen> {
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
      drawer: JSDrawerScreen(),
      appBar: jsAppBar(context, notifications: false, message: false, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.height,
                jsCompleteProfileStep(context, hideCV: false, stepSubTitle: 4),
                16.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Skills", style: boldTextStyle(size: 20)),
                    16.height,
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : js_containerBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.lightbulb_outline_sharp),
                              16.width,
                              Text(
                                "Do you have any of these top skills employears are looking for?",
                                style: boldTextStyle(),
                                maxLines: 2,
                              ).flexible()
                            ],
                          ),
                          8.height,
                          JSSkillComponent(),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(left: 16, right: 16, top: 8, bottom: 50),
              ],
            ),
          ),
          16.height,
          Positioned(
            left: 16,
            right: 16,
            bottom: 8,
            child: AppButton(
              color: js_primaryColor,
              width: context.width(),
              onTap: () {
                JSCompleteProfileFiveScreen().launch(context);
              },
              child: Text("Next", style: boldTextStyle(color: white)),
            ),
          ),
        ],
      ),
    );
  }
}
