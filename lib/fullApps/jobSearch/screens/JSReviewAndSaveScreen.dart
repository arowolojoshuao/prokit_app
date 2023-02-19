import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSReviewAndSaVeComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSReviewAndSaveScreen extends StatefulWidget {
  const JSReviewAndSaveScreen({Key? key}) : super(key: key);

  @override
  _JSReviewAndSaveScreenState createState() => _JSReviewAndSaveScreenState();
}

class _JSReviewAndSaveScreenState extends State<JSReviewAndSaveScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<JSPopularCompanyModel> reviewDraftList = getReviewDraftList();

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
      appBar: jsAppBar(context, notifications: true, message: true, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Container(
              color: appStore.isDarkModeOn ? scaffoldDarkColor : js_backGroundColor,
              child: Text("Review draft and save", style: boldTextStyle(size: 24)),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              alignment: Alignment.topLeft,
              width: context.width(),
            ),
            ListView.builder(
              itemCount: reviewDraftList.length,
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                JSPopularCompanyModel data = reviewDraftList[index];

                return JSReviewAndSaVeComponent(reviewDraftList: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
