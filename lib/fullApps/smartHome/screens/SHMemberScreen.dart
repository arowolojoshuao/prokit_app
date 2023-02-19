import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHNewMemberScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHViewMemberScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';

class SHMemberScreen extends StatefulWidget {
  @override
  SHMemberScreenState createState() => SHMemberScreenState();
}

class SHMemberScreenState extends State<SHMemberScreen> {
  List<SHModel> list = getMemberList();

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
      backgroundColor: SHScaffoldDarkColor,
      appBar: appBarWidget(
        '',
        elevation: 0,
        showBack: false,
        color: SHScaffoldDarkColor,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close, color: white),
            ),
            16.width,
            Text('Members', style: boldTextStyle(color: white)).expand(),
            IconButton(
              onPressed: () async {
                SHModel data = await SHNewMemberScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                list.add(data);
                setState(() {});
              },
              icon: Icon(Icons.add, color: white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: list.map(
            (e) {
              return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: SHContainerColor),
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonSHCachedNetworkImage(
                      e.img!,
                      fit: BoxFit.cover,
                      height: 75,
                      width: 75,
                    ).cornerRadiusWithClipRRect(50),
                    16.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.name.validate(), style: primaryTextStyle(color: white)),
                        8.height,
                        Text(e.subtitle.validate(), style: primaryTextStyle(color: white)),
                      ],
                    )
                  ],
                ),
              ).onTap(
                () async {
                  SHModel data = await SHViewMemberScreen(shModel: e).launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                  list.remove(e);
                  setState(() {});
                },
                borderRadius: radius(20),
              ).paddingAll(16);
            },
          ).toList(),
        ),
      ),
    );
  }
}
