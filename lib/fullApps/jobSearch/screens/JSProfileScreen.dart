import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSCvComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/model/JSPopularCompanyModel.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSDataGenerator.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSProfileScreen extends StatefulWidget {
  const JSProfileScreen({Key? key}) : super(key: key);

  @override
  _JSProfileScreenState createState() => _JSProfileScreenState();
}

class _JSProfileScreenState extends State<JSProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<JSPopularCompanyModel> skillList = getSkillList();

  TabController? controller;

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: JSDrawerScreen(),
        appBar: jsAppBar(context, backWidget: true, homeAction: true, message: false, notifications: false, bottomSheet: true, callBack: () {
          setState(() {});
          scaffoldKey.currentState!.openDrawer();
        }),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    boxShape: BoxShape.circle,
                    border: Border.all(color: js_primaryColor, width: 4),
                    backgroundColor: context.scaffoldBackgroundColor,
                  ),
                  padding: EdgeInsets.all(24),
                  child: Text('SJ', style: boldTextStyle(size: 22)),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Smit Jhon', style: boldTextStyle(size: 22)), IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: js_primaryColor))],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: context.iconColor),
                        8.width,
                        Text('London', style: boldTextStyle()),
                      ],
                    ),
                  ],
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            TabBar(
              labelColor: appStore.isDarkModeOn ? white : black,
              unselectedLabelColor: gray,
              isScrollable: false,
              indicatorColor: js_primaryColor,
              tabs: [
                Tab(child: Text("CV", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                Tab(child: Text("About me", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
              ],
              controller: controller,
            ),
            TabBarView(
              children: [
                JSCvComponent(),
                JSCvComponent(),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
